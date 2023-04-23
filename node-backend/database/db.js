const mysql = require("mysql2/promise");

const pool = mysql.createPool({
  host: process.env.RDS_HOSTNAME,
  user: process.env.RDS_USERNAME,
  password: process.env.RDS_PASSWORD,
  database: process.env.RDS_DB_NAME,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});

module.exports.query = async (sql, values) => {
  const conn = await pool.getConnection();
  try {
    const [rows] = await conn.query(sql, values);
    return [rows, null];
  } catch (err) {
    return [null, err];
  } finally {
    conn.release();
  }
};
