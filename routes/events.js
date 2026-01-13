const express = require("express");
const router = express.Router();
const pool = require("../db");

router.get("/", async (req, res) => {
  try {
    const result = await pool.query(
      `SELECT 
        id,
        event_name,
        event_date,
        event_location,
        event_description,
        event_attendees,
        event_category,
        event_organizer,
        event_website,
        event_hashtag,
        event_sponsor,
        created_at,
        updated_at
      FROM events`
    );

    res.json({
      success: true,
      data: result.rows,
    });
  } catch (error) {
    console.error("Fetch events error", error);
    res.status(500).json({
      success: false,
      message: "Failed to fetch events",
    });
  }
});

router.get("/:id/detail", async (req, res) => {
  try {
    const eventId = parseInt(req.params.id);

    const result = await pool.query(
      `
      SELECT 
        id,
        event_name,
        event_date,
        event_location,
        event_description,
        event_attendees,
        event_category,
        event_organizer,
        event_website,
        event_hashtag,
        event_sponsor,
        created_at,
        updated_at
      FROM events
      WHERE id = $1
    `,
      [eventId]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: "Event not found",
      });
    }

    res.json({
      success: true,
      data: result.rows[0],
    });
  } catch (error) {
    console.error("Fetch event detail error:", error);
    res.status(500).json({
      success: false,
      message: "Failed to fetch event detail",
    });
  }
});

module.exports = router;
