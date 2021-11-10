-- Create schemas
DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE Regions (id SERIAL PRIMARY KEY, Region TEXT NOT NULL);

CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    Username TEXT NOT NULL,
    Password TEXT NOT NULL,
    Pref_Reg INTEGER REFERENCES Regions ON DELETE SET NULL);

CREATE TABLE Categories (
    id SERIAL PRIMARY KEY,
    Category VARCHAR(30) NOT NULL);

CREATE TABLE Posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(30) NOT NULL,
    text VARCHAR(500) NOT NULL,
    Users INTEGER REFERENCES Users ON DELETE SET NULL,
    Category INTEGER REFERENCES Categories ON DELETE SET NULL,
    Region INTEGER REFERENCES Regions ON DELETE SET NULL,
    Location VARCHAR(30) NOT NULL);

INSERT INTO Regions (Region) VALUES('West'), ('East'), ('Central');

INSERT INTO
    Users (Username, Password, Pref_Reg)
VALUES
    ('User1', '1234', 1),
    ('User2ForTesting', 'lkj3465k7', 3),
    ('SpongBob', 'kgdfh0000', 2);

INSERT INTO
    Categories (Category)
VALUES
    ('Cartoons'),
    ('Sports'),
    ('Coding');

INSERT INTO
    Posts (title, text, Users, Category, Region, Location)
VALUES
    (
        'Title1',
        'Some sentence',
        '1',
        '1',
        '2',
        'New York'
    ),
    (
        'Title2',
        'Some sentence here again',
        '3',
        '2',
        '3',
        'Houston'
    );