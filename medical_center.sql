-- Create schemas
DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center
-- Create tables
CREATE TABLE IF NOT EXISTS Doctors
(
    id SERIAL PRIMARY KEY,
    Name VARCHAR(30) NOT NULL,
    Specialty VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS Patients
(
    id SERIAL PRIMARY KEY,
    Name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS Visits
(
    id SERIAL PRIMARY KEY,
    Doctors_id INTEGER NOT NULL,
    Patients_id INTEGER NOT NULL,
    Disease_id INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Diseases
(
    id SERIAL PRIMARY KEY,
    Disease VARCHAR(30) NOT NULL
);


-- Create FKs
ALTER TABLE Visits
    ADD    FOREIGN KEY (Doctors_id)
    REFERENCES Doctors(id)
    MATCH SIMPLE
;
    
ALTER TABLE Visits
    ADD    FOREIGN KEY (Patients_id)
    REFERENCES Patients(id)
    MATCH SIMPLE
;
    
ALTER TABLE Visits
    ADD    FOREIGN KEY (Disease_id)
    REFERENCES Diseases(id)
    MATCH SIMPLE
;
    
INSERT INTO Doctors (Name, Specialty)
VALUES ('Doctor Phill', 'Shows'), ('Dr. Drake Remoray', 'Friends'), ('Dr. Corona', 'Virology');

INSERT INTO Patients (Name)
VALUES ('Pedro Moyano'), ('Larry King'), ('Ghandi');

INSERT INTO Diseases (Disease)
VALUES ('Cancer'), ('Flue'), ('Some other ilness');

INSERT INTO Visits (Doctors_id, Patients_id, Disease_id)
VALUES (1,1,2), (2,1,3), (3,2, 1);
