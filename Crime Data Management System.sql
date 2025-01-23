CREATE DATABASE CrimeDataManagement;
USE CrimeDataManagement;
CREATE TABLE Crimes (
    crime_id INT PRIMARY KEY AUTO_INCREMENT,
    crime_type VARCHAR(50),  
    location VARCHAR(100), 
    date_time DATETIME,           
    status VARCHAR(20)             
);
CREATE TABLE Suspects (
    suspect_id INT PRIMARY KEY AUTO_INCREMENT,
    crime_id INT,                  -- Links to the specific crime in the Crimes table.
    name VARCHAR(100),             -- Name of the suspect.
    address VARCHAR(150),          -- Address of the suspect.
    contact_info VARCHAR(15),      -- Contact details of the suspect.
    status VARCHAR(20),            -- E.g., 'Arrested', 'Released', 'Wanted'.
    FOREIGN KEY (crime_id) REFERENCES Crimes(crime_id)  -- Links to Crimes table.
);
CREATE TABLE Witnesses (
    witness_id INT PRIMARY KEY AUTO_INCREMENT,
    crime_id INT,                  -- Links to the specific crime in the Crimes table.
    name VARCHAR(100),             -- Name of the witness.
    statement TEXT,                -- Statement provided by the witness.
    contact_info VARCHAR(15),      -- Contact details of the witness.
    FOREIGN KEY (crime_id) REFERENCES Crimes(crime_id)  -- Links to Crimes table.
);
CREATE TABLE Evidence (
    evidence_id INT PRIMARY KEY AUTO_INCREMENT,
    crime_id INT,                  -- Links to the specific crime in the Crimes table.
    evidence_type VARCHAR(50),     -- Type of evidence, e.g., 'Weapon', 'Fingerprint'.
    description TEXT,              -- Description of the evidence.
    storage_location VARCHAR(100), -- Where the evidence is stored.
    FOREIGN KEY (crime_id) REFERENCES Crimes(crime_id)  -- Links to Crimes table.
);
CREATE TABLE PoliceOfficers (
    officer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),             -- Name of the officer.
    `rank` VARCHAR(50),            -- Rank of the officer, e.g., 'Inspector', 'Sergeant'.
    department VARCHAR(50),        -- Department of the officer, e.g., 'Cybercrime', 'Homicide'.
    assigned_case_id INT,          -- Case assigned to the officer.
    FOREIGN KEY (assigned_case_id) REFERENCES Crimes(crime_id)  -- Links to Crimes table.
);
INSERT INTO Crimes (crime_type, location, date_time, status)
VALUES
('Theft', 'Connaught Place, Delhi', '2024-01-10 15:30:00', 'Open'),
('Fight', 'Marine Drive, Mumbai', '2024-01-15 20:45:00', 'Solved'),
('Cyberbullying', 'Online Chat Room', '2024-01-18 12:00:00', 'Open');
INSERT INTO Suspects (crime_id, name, address, contact_info, status)
VALUES
(1, 'Rohan Sharma', 'Lajpat Nagar, Delhi', '9876543210', 'Arrested'),
(2, 'Aditi Verma', 'Colaba, Mumbai', '9123456789', 'Released'),
(3, 'Rahul Gupta', 'Kalyan Nagar, Bangalore', '8901234567', 'Wanted');
INSERT INTO Witnesses (crime_id, name, statement, contact_info)
VALUES
(1, 'Pooja Singh', 'Saw someone running away with a bag.', '8012345678'),
(2, 'Vivek Chaturvedi', 'Heard loud arguments before the fight started.', '9012345678'),
(3, 'Anjali Patel', 'Saw abusive messages in the group chat.', '7012345678');
INSERT INTO Evidence (crime_id, evidence_type, description, storage_location)
VALUES
(1, 'Fingerprint', 'Found on the stolen bag.', 'Delhi Crime Lab'),
(2, 'Video', 'Footage from a nearby CCTV camera.', 'Mumbai Police Station'),
(3, 'Screenshot', 'Screenshots of abusive messages.', 'Cybercrime Lab, Bangalore');
INSERT INTO PoliceOfficers (name, `rank` , department, assigned_case_id)
VALUES
('Inspector Rajesh Kumar', 'Inspector', 'Theft Department', 1),
('Officer Priya Iyer', 'Sub-Inspector', 'Public Safety', 2),
('Inspector Anand Menon', 'Inspector', 'Cybercrime', 3);
SELECT * FROM Crimes WHERE status = 'Open';
SELECT * FROM Evidence WHERE crime_id = 1;
SELECT Witnesses.name AS Witness, Crimes.crime_type AS Crime, Witnesses.statement
FROM Witnesses
JOIN Crimes ON Witnesses.crime_id = Crimes.crime_id;
SELECT PoliceOfficers.name AS Officer, Crimes.crime_type AS Case_Type
FROM PoliceOfficers
JOIN Crimes ON PoliceOfficers.assigned_case_id = Crimes.crime_id;









