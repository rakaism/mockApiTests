require("dotenv").config();

const express = require("express");
const app = express();
const port = process.env.PORT || 3000;

app.use(express.json());

const eventsRouter = require("./routes/events");
const authRouter = require("./routes/auth");

app.use("/api/events", eventsRouter);
app.use("/api/auth", authRouter);

app.get("/", (req, res) => res.send("OK"));

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
