const mysql = require('mysql2/promise');

async function testRegisterAndCheckDB() {
  console.log('\n==================================================');
  console.log('🧪 VERIFYING USER REGISTRATION & MYSQL INSERTION');
  console.log('==================================================\n');

  const testUser = {
    username: 'testuser_' + Date.now().toString().slice(-4),
    password: '123',
    fullName: 'Khách Hàng Kiểm Thử',
    phone: '09' + Math.floor(10000000 + Math.random() * 90000000)
  };

  console.log(`1. Sending HTTP POST request to API: http://localhost:5000/api/auth/register ...`);
  console.log(`   Data: Username="${testUser.username}", Name="${testUser.fullName}", Phone="${testUser.phone}"`);

  try {
    const response = await fetch('http://localhost:5000/api/auth/register', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(testUser)
    });

    const data = await response.json();
    console.log(`\n2. API Server Response:`, JSON.stringify(data, null, 2));

    if (data.success) {
      console.log(`\n3. Querying MySQL Database 'teajoy_store' to verify row insertion...`);
      const conn = await mysql.createConnection({
        host: '127.0.0.1',
        port: 3306,
        user: 'root',
        password: '06112005',
        database: 'teajoy_store'
      });

      const [accounts] = await conn.query('SELECT * FROM TAI_KHOAN WHERE ten_dang_nhap = ?', [testUser.username]);
      console.log(`\n📌 [MySQL TAI_KHOAN Table Row]:`, accounts);

      const [customers] = await conn.query('SELECT * FROM KHACH_HANG WHERE tai_khoan_id = ?', [accounts[0].id]);
      console.log(`\n📌 [MySQL KHACH_HANG Table Row]:`, customers);

      await conn.end();

      console.log(`\n==================================================`);
      console.log(`🎉 SUCCESS! Verified user "${testUser.username}" was saved directly into MySQL tables!`);
      console.log(`==================================================\n`);
    } else {
      console.error(`❌ Registration API failed:`, data.message);
    }
  } catch (err) {
    console.error(`❌ Test failed with error:`, err.message);
  }
}

testRegisterAndCheckDB();
