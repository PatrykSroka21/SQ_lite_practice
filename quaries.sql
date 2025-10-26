-- =========================================
-- Skapa tabeller
-- =========================================
DROP TABLE IF EXISTS Songs;
DROP TABLE IF EXISTS Artists;

CREATE TABLE Artists (
artist_id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT NOT NULL UNIQUE,
genre TEXT,
country TEXT
);

CREATE TABLE Songs (
song_id INTEGER PRIMARY KEY AUTOINCREMENT,
title TEXT NOT NULL,
release_year INTEGER,
duration REAL NOT NULL,
artist_id INTEGER NOT NULL,
FOREIGN KEY (artist_id) REFERENCES Artists(artist_id) ON DELETE CASCADE
);

-- =========================================
-- INSERT: Lägg till data
-- =========================================
INSERT INTO Artists (name, genre, country)
VALUES
('The Weeknd', 'R&B/Pop', 'Canada'),
('Billie Eilish', 'Alternative/Pop', 'USA'),
('Avicii', 'EDM', 'Sweden'),
('Eminem', 'Rap', 'USA'),
('Coldplay', 'Alternative Rock', 'UK');

INSERT INTO Songs (title, release_year, duration, artist_id)
VALUES
('Blinding Lights', 2019, 3.22, 1),
('Save Your Tears', 2020, 3.35, 1),
('Bad Guy', 2019, 3.14, 2),
('Wake Me Up', 2013, 4.09, 3),
('Lose Yourself', 2002, 5.26, 4);

-- =========================================
-- INSERT: Nya rader
-- =========================================
INSERT INTO Songs (title, release_year, duration, artist_id)
VALUES ('Viva La Vida', 2008, 4.02, 5);

INSERT INTO Artists (name, genre, country)
VALUES ('Ariana Grande', 'Pop/R&B', 'USA');

INSERT INTO Songs (title, release_year, duration, artist_id)
VALUES ('7 rings', 2019, 3.00, 6);

-- =========================================
-- SELECT med WHERE
-- =========================================
-- 1: Hämta alla artister från USA
SELECT * FROM Artists WHERE country = 'USA';

-- 2: Hämta låtar som är längre än 4 minuter
SELECT title, duration FROM Songs WHERE duration > 4.0;

-- =========================================
-- SELECT med JOIN
-- =========================================
-- Hämta låtar och tillhörande artistnamn
SELECT Songs.title, Songs.release_year, Artists.name AS artist
FROM Songs
JOIN Artists ON Songs.artist_id = Artists.artist_id;

-- =========================================
-- UPDATE
-- =========================================
-- Uppdatera längden på en låt
UPDATE Songs
SET duration = 3.50
WHERE title = '7 rings';

-- =========================================
-- DELETE
-- =========================================
-- Ta bort en artist (och relaterade låtar via ON DELETE CASCADE)
DELETE FROM Artists WHERE name = 'Avicii';
