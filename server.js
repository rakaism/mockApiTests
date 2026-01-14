require("dotenv").config();

const express = require("express");
const app = express();
const port = process.env.PORT || 3000;
const pool = require("./db");

app.use(express.json());

const eventsRouter = require("./routes/events");
const authRouter = require("./routes/auth");

app.use("/api/events", eventsRouter);
app.use("/api/auth", authRouter);

app.get("/", (req, res) => res.send("Involuntir Frontend Test"));

app.get("/api/test-db", async (req, res) => {
  try {
    const result = await pool.query("SELECT NOW()");
    res.json({
      success: true,
      message: "db connected",
      time: result.rows[0],
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      error: error.message,
    });
  }
});

if (process.env.VERCEL) {
  module.exports = app;
} else {
  app.listen(port, () => {
    console.log(`Server listening on port ${port}`);
  });
}
