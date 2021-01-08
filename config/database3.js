const {
  createPool
} = require("mysql");


const pool3 = createPool({
  host: process.env.DB_HOST3,
  port: process.env.DB_PORT3,
  user: process.env.DB_USER3,
  password: process.env.DB_PASSWORD3,
  database: process.env.MYSQL_DATABASE3,
  connectionLimit: 10
});

pool3.on('connection', (connection) => {
  connection.query('SET NAMES utf8')
});


module.exports = pool3;