require("dotenv").config();

const express = require("express");
const router = express.Router();
const connection = require("../db");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const authMiddleware = require("../middleware/auth");

router.post("/login", async (req, res) => {
  try {
    const { email, password } = req.body;
    if (!email || !password) {
      return res.status(422).json({ msg: "Email dan password harus ada" });
    }

    const result = await connection.query(
      "SELECT * FROM users WHERE email = $1",
      [email]
    );
    if (result.rows.length === 0) {
      return res.status(401).json({ msg: "Email atau password salah" });
    }

    const user = result.rows[0];
    const ok = await bcrypt.compare(password, user.password);
    if (!ok) {
      return res.status(401).json({ msg: "Email atau password salah" });
    }

    const payload = { id: user.id, email: user.email, name: user.name };
    const token = jwt.sign(payload, process.env.JWT_SECRET);

    return res.json({
      access_token: token,
      token_type: "Bearer",
      user: { id: user.id, email: user.email, name: user.name },
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({
      msg: "Server error",
    });
  }
});

router.post("/logout", authMiddleware, async (req, res) => {
  res.json({
    success: true,
    message: "Logout sukses",
  });
});

module.exports = router;
