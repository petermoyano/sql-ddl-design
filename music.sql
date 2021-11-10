-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  Name TEXT NOT NULL
);

CREATE TABLE producers(
  id SERIAL PRIMARY KEY,
  Name TEXT NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artists INTEGER REFERENCES artists,
  album TEXT NOT NULL,
  producers INTEGER REFERENCES producers
);

INSERT INTO producers (Name) 
VALUES 
('{"Dust Brothers", "Stephen Lironi"}'),
('{"Roy Thomas Baker"}'),
('{"Walter Afanasieff"}'),
('{"Benjamin Rice"}');

INSERT INTO artists(Name)
VALUES
('{"Hanson"}'),
('{"Queen"}'),
('{"Mariah Cary", "Boyz II Men"}'),
('{"Lady Gaga", "Bradley Cooper"}');

INSERT INTO songs
  (title, duration_in_seconds, release_date, artists, album, producers)
VALUES
  ('MMMBop', 238, '04-15-1997', 1, 'Middle of Nowhere', 1),
  ('Bohemian Rhapsody', 355, '10-31-1975', 2, 'A Night at the Opera', 2),
  ('One Sweet Day', 282, '11-14-1995', 3, 'Daydream', 3),
  ('Shallow', 216, '09-27-2018', 4, 'A Star Is Born', 4);