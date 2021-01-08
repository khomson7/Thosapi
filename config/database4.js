const { createPool } = require("mysql");


const pool4 = createPool({
  host: process.env.DB_HOST4,
  port: process.env.DB_PORT4,
  user: process.env.DB_USER4,
  password: process.env.DB_PASSWORD4,
  database: process.env.MYSQL_DATABASE4,
  connectionLimit: 10
});

pool4.on('connection', (connection) => {
  connection.query('SET NAMES utf8')
});


module.exports = pool4;