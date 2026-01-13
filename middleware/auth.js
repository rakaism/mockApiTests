// middleware/auth.js
const jwt = require("jsonwebtoken");
const pool = require("../db");
require("dotenv").config();

const authMiddleware = async (req, res, next) => {
  try {
    const auth = req.headers.authorization;
    if (!auth || !auth.startsWith("Bearer ")) {
      return res.status(401).json({ msg: "Unauthorized" });
    }

    const token = auth.split(" ")[1];
    // cek blacklist
    const result = await pool.query(
      "SELECT id FROM token_blacklist WHERE token = $1 AND expires_at > NOW() LIMIT 1",
      [token]
    );
    if (result.rows.length > 0) {
      return res.status(401).json({ msg: "Token revoked" });
    }

    const payload = jwt.verify(token, process.env.JWT_SECRET);

    req.user = {
      id: payload.id,
      email: payload.email,
      name: payload.name,
    };
    req.token = token;
    next();
  } catch (err) {
    return res.status(401).json({ msg: "Invalid or expired token" });
  }
};

module.exports = authMiddleware;
