require("dotenv").config();
const { Pool } = require("pg");

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: {
    rejectUnauthorized: false,
  },
});

pool.connect((err, client, release) => {
  if (err) {
    console.error("DB: Gagal", err.stack);
  } else {
    console.log("DB: Sukses");
    release();
  }
});

module.exports = pool;
