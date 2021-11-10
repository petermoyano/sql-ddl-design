-- Create schemas
DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league
-- Create tables
CREATE TABLE IF NOT EXISTS Teams
(
    id SERIAL PRIMARY KEY,
    Name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Players
(
    id SERIAL PRIMARY KEY,
    Name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS Referees
(
    id SERIAL PRIMARY KEY,
    Name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS Matches
(
    id SERIAL PRIMARY KEY,
    Home_Team INTEGER NOT NULL,
    Visitor_Team INTEGER NOT NULL,
    Home_Team_Score INTEGER NOT NULL,
    Visitor_Team_Score INTEGER NOT NULL,
    Referee INTEGER NOT NULL,
    Referee2 INTEGER NOT NULL,
    Referee3 INTEGER NOT NULL,
    Season INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Seasons
(
    id SERIAL PRIMARY KEY,
    Start_date DATE NOT NULL,
    End_date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Goals
(
    id SERIAL PRIMARY KEY,
    Player INTEGER NOT NULL,
    Own_Goal BOOLEAN NOT NULL,
    For_Team INTEGER NOT NULL,
    Match INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Lineups
(
    id SERIAL PRIMARY KEY,
    Match INTEGER NOT NULL,
    player INTEGER NOT NULL,
    Team INTEGER NOT NULL
);


-- Create FKs
ALTER TABLE Matches
    ADD    FOREIGN KEY (Visitor_Team)
    REFERENCES Teams(id)
    MATCH SIMPLE
;
    
ALTER TABLE Matches
    ADD    FOREIGN KEY (Home_Team)
    REFERENCES Teams(id)
    MATCH SIMPLE
;
        
ALTER TABLE Matches
    ADD    FOREIGN KEY (Referee)
    REFERENCES Referees(id)
    MATCH SIMPLE
;
ALTER TABLE Matches
    ADD    FOREIGN KEY (Referee2)
    REFERENCES Referees(id)
    MATCH SIMPLE
;
ALTER TABLE Matches
    ADD    FOREIGN KEY (Referee3)
    REFERENCES Referees(id)
    MATCH SIMPLE
;
    
ALTER TABLE Matches
    ADD    FOREIGN KEY (Season)
    REFERENCES Seasons(id)
    MATCH SIMPLE
;    

ALTER TABLE Goals
    ADD    FOREIGN KEY (Player)
    REFERENCES Players(id)
    MATCH SIMPLE
;
    
ALTER TABLE Goals
    ADD    FOREIGN KEY (For_Team)
    REFERENCES Teams(id)
    MATCH SIMPLE
;

ALTER TABLE Goals
    ADD    FOREIGN KEY (Match)
    REFERENCES Matches(id)
    MATCH SIMPLE
;

ALTER TABLE Lineups
    ADD    FOREIGN KEY (player)
    REFERENCES Players(id)
    MATCH SIMPLE
;
    
ALTER TABLE Lineups
    ADD    FOREIGN KEY (Match)
    REFERENCES Matches(Id)
    MATCH SIMPLE
;
    
ALTER TABLE Lineups
    ADD    FOREIGN KEY (Team)
    REFERENCES Teams(id)
    MATCH SIMPLE
;

INSERT INTO Teams (Name) VALUES ('Sharks'), ('Devils'), ('Red Socks');

INSERT INTO Players (Name)
VALUES ('Lionel Messi'), ('Pele'), ('Roberto Carlos');

INSERT INTO Seasons(Start_date, End_date)
VALUES ('2010-01-01', '2010-12-31'), ('2011-01-01', '2011-12-31'), ('2012-01-01', '2012-12-31');

INSERT INTO Referees (Name)
VALUES ('Peter'), ('Thomas'), ('Jhon');

INSERT INTO Matches(Home_Team, Visitor_Team, Home_Team_Score, Visitor_Team_Score, Referee, Referee2, Referee3, Season)
VALUES
(1, 2, 2, 0, 1, 2, 3, 2), (2, 3, 5, 6, 3, 2, 1, 3), (3, 1, 0, 5, 2, 3, 1, 2);

INSERT INTO Goals (Player, Own_Goal, For_Team, Match)
VALUES
(1, True, 2, 1), (2, False, 1, 2), (3, False, 3, 2);

INSERT INTO Lineups (Match, Player, Team)
VALUES (1,2,1), (2,1,3), (3, 3, 3);

