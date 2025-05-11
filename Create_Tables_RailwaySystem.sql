CREATE TABLE Passenger (
    First_Name VARCHAR(50) NOT NULL, 
    Last_Name VARCHAR(50) NOT NULL,
    Address VARCHAR(100),
    City VARCHAR(50),
    County VARCHAR(50),
    Phone2 CHAR(15),
    SSN INTEGER PRIMARY KEY,
    Birth_Date DATE
);

CREATE TABLE Train (
    Train_Number INTEGER PRIMARY KEY CHECK (Train_Number BETWEEN 1 AND 5),
    Train_Name VARCHAR(100) NOT NULL,
    Premium_Fair FLOAT,
    General_Fair FLOAT,
    Source_Station VARCHAR(50),
    Destination_Station VARCHAR(50),
    Available_Weekdays VARCHAR(100)
);

CREATE TABLE Booked (
    Passenger_SSN INTEGER,
    Train_Number INTEGER,
    Ticket_Type VARCHAR(10) NOT NULL CHECK (Ticket_Type IN ('Premium', 'General')),
    Status VARCHAR(10) NOT NULL CHECK (Status IN ('Booked', 'WaitL')),
    PRIMARY KEY (Passenger_SSN, Train_Number),
    FOREIGN KEY (Passenger_SSN) REFERENCES Passenger(SSN),
    FOREIGN KEY (Train_Number) REFERENCES Train(Train_Number)
);

CREATE TABLE Train_Status (
    Train_Date DATE,
    Train_Name VARCHAR(100),
    Premium_Seats_Available INTEGER CHECK (Premium_Seats_Available BETWEEN 0 AND 10),
    General_Seats_Available INTEGER CHECK (General_Seats_Available BETWEEN 0 AND 10),
    Premium_Seats_Occupied INTEGER CHECK (Premium_Seats_Occupied BETWEEN 0 AND 10),
    General_Seats_Occupied INTEGER CHECK (General_Seats_Occupied BETWEEN 0 AND 10),
    PRIMARY KEY (Train_Name, Train_Date)
);