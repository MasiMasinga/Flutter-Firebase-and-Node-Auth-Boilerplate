const db = require("../database/db");

const testConnection = async () => {
  try {
    const [rows, fields] = await db.query("SELECT 1 + 1 AS solution");
    console.log(`The solution is: ${rows[0].solution}`);
  } catch (err) {
    console.error(err);
  } finally {
    db.close();
  }
};

testConnection();
