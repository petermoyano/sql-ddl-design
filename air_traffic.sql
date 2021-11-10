-- from the terminal run:
-- psql < air_traffic.sql
DROP DATABASE IF EXISTS air_traffic;
CREATE DATABASE air_traffic;
\c air_traffic 

CREATE TABLE Passangers (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL
);

CREATE TABLE Destinations (
  id SERIAL PRIMARY KEY,
  City VARCHAR(30) NOT NULL, 
  Country VARCHAR(30) NOT NULL
);

CREATE TABLE Airlines ( id SERIAL PRIMARY KEY, Name VARCHAR(30) NOT NULL);

CREATE TABLE flight (
  id SERIAL PRIMARY KEY,
  Passanger INTEGER REFERENCES Passangers NOT NULL,
  airline INTEGER REFERENCES Airlines NOT NULL,
  seat VARCHAR(4),
  _from INTEGER REFERENCES Destinations NOT NULL,
  _to INTEGER REFERENCES Destinations NOT NULL,
  departure TIMESTAMP NOT NULL, 
  arrival TIMESTAMP NOT NULL
);

INSERT INTO Passangers (first_name, last_name)
VALUES
('Jennifer','Finch'), ('Thadeus', 'Gathercoal'), ('Sonja', 'Pauley'), 
('Waneta', 'Skeleton'), ('Berkie', 'Wycliff') , ('Alvin','Leathes'), ('Cory','Squibbes');

INSERT INTO Airlines (Name) 
VALUES ('United'), ('Delta'), ('TUI Fly Belgium'), ('Air China'),
('American Airlines'), ('Avianca Brasil');

INSERT INTO Destinations (City, Country)
VALUES ('Seattle', 'United States'), ('London', 'United Kingdom'), ('Mexico City','Mexico')
, ('Beijing', 'China'), ('Santiago','Chile');

INSERT INTO flight (
    Passanger,
    airline,
    seat,
    _from,
    _to,
    departure,
    arrival
) VALUES
  (1, 2, '33B', 3, 1,  '2018-04-08 09:00:00', '2018-04-08 12:00:00'),
  (2, 4, '8A', 5, 2, '2018-12-19 12:45:00', '2018-12-19 16:15:00'),
  (5, 3, '12F', 1, 2, '2018-01-02 07:00:00', '2018-01-02 08:03:00'),
  (5, 1, '20A', 4, 3, '2018-04-15 16:50:00', '2018-04-15 21:00:00'),
  (3, 2, '1A', 2, 3, '2018-12-22 14:42:00', '2018-12-22 15:56:00');