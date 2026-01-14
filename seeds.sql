-- mock data

INSERT INTO users (email, password, name) VALUES 
('test@example.com', '$2a$12$OlF9wvP9NO0EmRddj9aLHOsNOJ/Dx6Lbo3eyvRkGEsDTBUvpzhINC', 'Test User'),
('john@example.com', '$2a$12$OlF9wvP9NO0EmRddj9aLHOsNOJ/Dx6Lbo3eyvRkGEsDTBUvpzhINC', 'John Doe'),
('jane@example.com', '$2a$12$OlF9wvP9NO0EmRddj9aLHOsNOJ/Dx6Lbo3eyvRkGEsDTBUvpzhINC', 'Jane Smith');

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