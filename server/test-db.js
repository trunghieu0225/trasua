const mysql = require('mysql2/promise');

async function testPassword() {
  const pwd = '06112005';
  console.log(`Testing MySQL root password: "${pwd}"...`);
  try {
    const conn = await mysql.createConnection({
      host: '127.0.0.1',
      port: 3306,
      user: 'root',
      password: pwd
    });
    console.log(`🎉 BINGO SUCCESS! Connected to MySQL 8.0 Server with password "${pwd}"!`);
    
    // Check if teajoy_store database exists
    const [dbs] = await conn.query("SHOW DATABASES LIKE 'teajoy_store'");
    if (dbs.length > 0) {
      console.log(`✅ Database 'teajoy_store' exists!`);
    } else {
      console.log(`⚠️ Database 'teajoy_store' does not exist yet. Creating database 'teajoy_store'...`);
      await conn.query("CREATE DATABASE IF NOT EXISTS `teajoy_store` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;");
      console.log(`✅ Database 'teajoy_store' created successfully!`);
    }

    await conn.end();
    return true;
  } catch (err) {
    console.error(`❌ Connection failed:`, err.message);
    return false;
  }
}

testPassword();
