INSERT INTO Passenger (First_Name, Last_Name, Address, City, County, Phone2, SSN, Birth_Date) VALUES 
('James', 'Butt', '6649 N Blue Gum St', 'New Orleans', 'Orleans', '504-845-1427', 264816896, '1968-10-10'),
('Josephine', 'Darakjy', '4 B Blue Ridge Blvd', 'Brighton', 'Livingston', '810-374-9840', 240471168, '1975-11-01'),
('Art', 'Venere', '8 W Cerritos Ave #54', 'Bridgeport', 'Gloucester', '605-264-4130', 285200976, '1982-11-13'),
('Lenna', 'Paprocki', '639 Main St', 'Anchorage', 'Anchorage', '907-921-2010', 309323096, '1978-08-09'),
('Donette', 'Foller', '34 Center St', 'Hamilton', 'Butler', '513-549-4561', 272610795, '1990-06-11'),
('Simona', 'Morasca', '3 Mcauley Dr', 'Ashland', 'Ashland', '419-800-6759', 250951162, '1994-08-15'),
('Mitsue', 'Tollner', '7 Eads St', 'Chicago', 'Cook', '773-924-8565', 272913578, '1984-07-04'),
('Leota', 'Dilliard', '7 W Jackson Blvd', 'San Jose', 'Santa Clara', '408-813-1105', 268682534, '1991-05-09'),
('Sage', 'Wieser', '5 Boston Ave #88', 'Sioux Falls', 'Minnehaha', '605-794-4895', 310908858, '1982-02-25'),
('Kris', 'Marrier', '228 Runamuck Pl #2808', 'Baltimore', 'Baltimore City', '410-804-4694', 322273872, '1956-04-04'),
('Minna', 'Amigon', '2371 Jerrold Ave', 'Kulpsville', 'Montgomery', '215-422-8694', 256558303, '1995-09-09'),
('Abel', 'Maclead', '37275 St Rt 17m M', 'Middle Island', 'Suffolk', '631-677-3675', 302548590, '1960-11-05'),
('Kiley', 'Caldarera', '25 E 75th St #69', 'Los Angeles', 'Los Angeles', '310-254-3084', 284965676, '1981-05-09'),
('Graciela', 'Ruta', '98 Connecticut Ave Nw', 'Chagrin Falls', 'Geauga', '440-579-7763', 277292710, '1982-02-25'),
('Cammy', 'Albares', '56 E Morehead St', 'Laredo', 'Webb', '956-841-7216', 331160133, '1956-04-04'),
('Mattie', 'Poquette', '73 State Road 434 E', 'Phoenix', 'Maricopa', '605-953-6360', 331293204, '1995-09-09'),
('Meaghan', 'Garufi', '69734 E Carrillo St', 'Mc Minnville', 'Warren', '931-235-7959', 290123298, '1960-11-02'),
('Gladys', 'Rim', '322 New Horizon Blvd', 'Milwaukee', 'Milwaukee', '414-377-2880', 286411536, '1991-05-09'),
('Yuki', 'Whobrey', '1 State Route 27', 'Taylor', 'Wayne', '313-341-4470', 294860856, '1985-02-25'),
('Fletcher', 'Flosi', '394 Manchester Blvd', 'Rockford', 'Winnebago', '815-426-5657', 317434088, '1961-04-04'),
('Emily', 'Parker', '1234 Elm Street', 'Los Angeles', 'Los Angeles', '213-555-7890', 814654987, '1985-05-15'),
('Michael', 'Smith', '5678 Oak Avenue', 'Chicago', 'Cook', '312-555-1234', 987654321, '1973-09-20'),
('Sarah', 'Johnson', '4321 Maple Lane', 'New York', 'New York', '212-555-5678', 345986511, '1990-03-25'),
('David', 'Willson', '7890 Birch Road', 'Houston', 'Harris', '713-555-4567', 565110925, '1982-11-12'),
('Jennifer', 'David', '2468 Pine Street', 'San Francisco', 'San Francisco', '415-555-2345', 667025599, '1997-02-05'),
('Mathew', 'Alison', '1357 Cedar Avenue', 'Miami', 'Dade', '305-555-7890', 343114946, '1993-03-01'),
('Laura', 'Martin', '6543 Aspen Court', 'Denver', 'Denver', '650-212-0099', 911247766, '1995-07-06'),
('John', 'Thomson', '8765 Redwood Drive', 'Phoenix', 'Maricopa', '214-323-7529', 717822387, '1990-09-09'),
('Jessica', 'Anderson', '908 Cooper St', 'Arlington', 'Tarrant', '914-21-0909', 676823082, '1993-02-11');



INSERT INTO Train (Train_Number, Train_Name, Premium_Fair, General_Fair, Source_Station, Destination_Station, Available_Weekdays) VALUES
(1, 'Orient Express', 800, 600, 'Paris', 'Istanbul', 'Monday, Tuesday, Wednesday, Thursday, Friday'),
(2, 'Flying Scottsman', 4000, 3500, 'Edinburgh', 'London', 'Friday, Saturday, Sunday'),
(3, 'Golden Arrow', 980, 860, 'Victoria', 'Dover', 'Monday, Tuesday, Wednesday'),
(4, 'Golden Chariot', 4300, 3800, 'Bangalore', 'Goa', 'Saturday, Sunday'),
(5, 'Maharaja Express', 5980, 4510, 'Delhi', 'Mumbai', 'Wednesday, Thursday, Friday');



INSERT INTO Booked (Passenger_SSN, Train_Number, Ticket_Type, Status) VALUES 
(284965676, 2, 'Premium', 'Booked'),
(317434088, 2, 'Premium', 'Booked'),
(240471168, 2, 'General', 'Booked'),
(310908858, 2, 'General', 'Booked'),
(322273872, 2, 'General', 'Booked'),
(277292710, 2, 'General', 'Booked'),
(302548590, 2, 'General', 'WaitL'),
(331293204, 2, 'General', 'WaitL'),
(264816896, 3, 'Premium', 'Booked'),
(286411536, 3, 'Premium', 'Booked'),
(294860856, 3, 'Premium', 'Booked'),
(285200976, 3, 'General', 'Booked'),
(256558303, 3, 'General', 'Booked'),
(268682534, 3, 'General', 'Booked'),
(272913578, 3, 'General', 'Booked'),
(250951162, 3, 'Premium', 'WaitL'),
(272610795, 4, 'Premium', 'Booked'),
(309323096, 4, 'Premium', 'Booked'),
(331160133, 4, 'Premium', 'Booked'),
(290123298, 4, 'General', 'Booked'),
(814654987, 4, 'General', 'Booked'),
(987654321, 4, 'General', 'Booked'),
(345986511, 4, 'Premium', 'WaitL'),
(565110925, 4, 'Premium', 'WaitL'),
(667025599, 4, 'General', 'WaitL'),
(343114946, 4, 'General', 'WaitL');



INSERT INTO Train_status (Train_Date, Train_Name, Premium_Seats_Available, General_Seats_Available, Premium_Seats_Occupied, General_Seats_Occupied) VALUES 
('Friday', 'Orient Express', 10, 10, 0, 0),
('Sunday', 'Flying Scottsman', 8, 0, 2, 4),
('Tuesday', 'Golden Arrow', 0, 1, 3, 4),
('Saturday', 'Golden Chariot', 0, 0, 3, 3);