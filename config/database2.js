const {
  createPool
} = require("mysql");


const pool2 = createPool({
  host: process.env.DB_HOST2,
  port: process.env.DB_PORT2,
  user: process.env.DB_USER2,
  password: process.env.DB_PASSWORD2,
  database: process.env.MYSQL_DATABASE2,
  connectionLimit: 10
});

pool2.on('connection', (connection) => {
  connection.query('SET NAMES utf8')
});


module.exports = pool2;