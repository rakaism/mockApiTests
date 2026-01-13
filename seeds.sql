-- Test Data untuk Mock API

-- 1. Insert Test User (password: "password123" di-hash dengan bcryptjs)
-- Hash dibuat dengan: bcryptjs.hashSync("password123", 10)
INSERT INTO users (email, password, name) VALUES 
('test@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86E36P4/TVG2', 'Test User'),
('john@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86E36P4/TVG2', 'John Doe'),
('jane@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86E36P4/TVG2', 'Jane Smith');

-- 2. Insert Test Events
INSERT INTO events (
  event_name, 
  event_date, 
  event_location, 
  event_description, 
  event_attendees, 
  event_category, 
  event_organizer, 
  event_website, 
  event_hashtag, 
  event_sponsor
) VALUES 
(
  'Tech Conference 2026',
  '2026-03-15T10:00:00Z',
  'Jakarta Convention Center',
  'Annual technology conference featuring latest innovations and trends in tech industry',
  500,
  'Technology',
  'Tech Indonesia',
  'https://techconf2026.id',
  '#TechConf2026',
  'Google, Microsoft, AWS'
),
(
  'Web Development Workshop',
  '2026-02-20T14:00:00Z',
  'Bandung Tech Hub',
  'Hands-on workshop on modern web development frameworks and best practices',
  100,
  'Education',
  'Web Developers Indonesia',
  'https://webdev-workshop.id',
  '#WebDevWorkshop',
  'Vercel, Firebase'
),
(
  'AI & Machine Learning Summit',
  '2026-04-10T09:00:00Z',
  'Surabaya Innovation Center',
  'Deep dive into artificial intelligence applications and machine learning implementations',
  300,
  'Technology',
  'AI Indonesia Community',
  'https://ai-summit.id',
  '#AISummit2026',
  'Nvidia, IBM, OpenAI'
),
(
  'Digital Marketing Expo',
  '2026-03-01T11:00:00Z',
  'Jakarta Pusat',
  'Comprehensive expo on digital marketing strategies and tools',
  200,
  'Marketing',
  'Digital Marketers Indonesia',
  'https://digitalmkt-expo.id',
  '#DigitalMktExpo',
  'Google Ads, Meta'
),
(
  'Startup Pitching Event',
  '2026-02-28T15:00:00Z',
  'Jakarta Startup Hub',
  'Startups pitching their ideas to investors and venture capitalists',
  150,
  'Business',
  'Indonesia Startup Association',
  'https://startup-pitch.id',
  '#StartupPitch2026',
  'PT Telkom, Bank Indonesia'
);

-- 3. Verifikasi Data yang Diinsert
SELECT COUNT(*) as total_users FROM users;
SELECT COUNT(*) as total_events FROM events;

-- 4. View all inserted data
SELECT 'Users' as table_name, COUNT(*) as count FROM users
UNION ALL
SELECT 'Events' as table_name, COUNT(*) as count FROM events
UNION ALL
SELECT 'Token Blacklist' as table_name, COUNT(*) as count FROM token_blacklist;

-- 5. Sample queries untuk testing

-- Get all events sorted by date
SELECT * FROM events ORDER BY event_date DESC;

-- Get specific event
SELECT * FROM events WHERE id = 1;

-- Get user by email
SELECT id, email, name FROM users WHERE email = 'test@example.com';

-- Get events in a date range
SELECT * FROM events 
WHERE event_date BETWEEN '2026-02-01T00:00:00Z' AND '2026-04-30T23:59:59Z'
ORDER BY event_date;

-- Get events by category
SELECT * FROM events WHERE event_category = 'Technology';

-- Get total attendees across all events
SELECT SUM(event_attendees) as total_attendees FROM events;

-- Get average attendees per event
SELECT AVG(event_attendees) as avg_attendees FROM events;
