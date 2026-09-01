const mysql = require('mysql2/promise');

const usersToTry = ['root', 'admin', 'user', 'developer', 'dev', 'mysql'];
const passwordsToTry = ['', '1234', '123456', 'root', 'admin'];
const hostsToTry = ['127.0.0.1', 'localhost'];

async function testAll() {
  console.log('Testing MySQL users and passwords...');
  for (const host of hostsToTry) {
    for (const user of usersToTry) {
      for (const pwd of passwordsToTry) {
        try {
          const conn = await mysql.createConnection({ host, port: 3306, user, password: pwd });
          console.log(`🎉 SUCCESS! Connected with Host: "${host}", User: "${user}", Password: "${pwd}"`);
          await conn.end();
          return { host, user, pwd };
        } catch (err) {
          if (err.code === 'ER_BAD_DB_ERROR') {
            console.log(`🎉 SUCCESS! Host: "${host}", User: "${user}", Password: "${pwd}" matched!`);
            return { host, user, pwd };
          }
        }
      }
    }
  }
  console.log('❌ Could not connect with any tested user/password combinations.');
  return null;
}

testAll();
