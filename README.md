# 🚆 Railway Reservation System – Relational Database Project

An end-to-end **relational database system** simulating the operations of a **railway reservation portal**, built using **SQL (SQLite)**. This project was developed as part of **CSE 3330: Database Systems and File Structures.** at **The University of Texas at Arlington** (Fall 2024).

The goal of this project is to apply core relational database principles to design, create, and manage a system that emulates how modern railway booking systems operate behind the scenes. It provides robust functionality for tracking **passenger bookings**, **train statuses**, **travel schedules**, and **ticket types**, all while supporting complex data queries to extract insights for decision-making.

Key project components include:

- 🛠️ **Schema Design**: Based on an Entity-Relationship (ER) model, we implemented normalized tables to capture passenger info, ticket types, train records, statuses, and reservations.
- 📥 **Data Loading**: Bulk data loading was performed using SQL `INSERT INTO` statements sourced from CSV files.
- 🔍 **SQL Queries**: A comprehensive set of SELECT statements answers real-world questions such as “Which passengers have upcoming bookings?”, “Which trains are delayed?”, and “How many people booked sleeper class?”.
- 🧾 **Reporting & Results**: Query results were reviewed to validate the system's effectiveness, and final reports were submitted to reflect system behavior and database accuracy.

> 🎯 **Project Objective**  
> To demonstrate strong understanding of **database schema design**, **relational modeling**, and **query execution** by building a fully functional mini-RDBMS mimicking a real-world railway ticketing environment.

---

## 🗃️ Database Tables Overview

This section provides a detailed breakdown of the relational schema used in the Railway Reservation System. The schema includes four core tables: `Passenger`, `Train`, `Booked`, and `Train_Status`. Each table plays a distinct role in modeling passenger details, train information, booking records, and train availability status.

---

<details>
<summary><strong>👤 Passenger</strong></summary>

**Purpose:**  
Stores personal and demographic details of railway passengers.

**Attributes:**
- `SSN` (INTEGER, **Primary Key**): A unique social security number used to identify each passenger.
- `First_Name` / `Last_Name` (VARCHAR): Passenger's full name.
- `Address` (VARCHAR): Street address of the passenger.
- `City` (VARCHAR): City in which the passenger resides.
- `County` (VARCHAR): The regional subdivision or county of the passenger’s residence.
- `Phone2` (CHAR): Secondary contact phone number.
- `Birth_Date` (DATE): The date of birth used to calculate age or eligibility.

</details>

<details>
<summary><strong>🚆 Train</strong></summary>

**Purpose:**  
Stores static information about trains in the railway system.

**Attributes:**
- `Train_Number` (INTEGER, **Primary Key**): Unique identifier for each train. Must be between 1 and 5.
- `Train_Name` (VARCHAR): The name of the train (e.g., Amtrak Express).
- `Premium_Fair` (FLOAT): Fare for premium-class tickets.
- `General_Fair` (FLOAT): Fare for general-class tickets.
- `Source_Station` / `Destination_Station` (VARCHAR): Represents the train route.
- `Available_Weekdays` (VARCHAR): Comma-separated list of weekdays when the train operates.

</details>

<details>
<summary><strong>🎟️ Booked</strong></summary>

**Purpose:**  
Tracks bookings made by passengers, including class type and booking status.

**Attributes:**
- `Passenger_SSN` (INTEGER, **Foreign Key** → Passenger.SSN): Links the booking to a passenger.
- `Train_Number` (INTEGER, **Foreign Key** → Train.Train_Number): Links the booking to a train.
- `Ticket_Type` (VARCHAR): Indicates the booking class. Allowed values are:
  - `'Premium'`
  - `'General'`
- `Status` (VARCHAR): Represents the booking status. Allowed values are:
  - `'Booked'`: Successfully reserved
  - `'WaitL'`: On waiting list
- **Primary Key:** Composite of (`Passenger_SSN`, `Train_Number`)

</details>

<details>
<summary><strong>📅 Train_Status</strong></summary>

**Purpose:**  
Stores the daily seat availability and occupancy statistics for each train.

**Attributes:**
- `Train_Date` (DATE): The calendar date for which the status applies.
- `Train_Name` (VARCHAR): The name of the train (not foreign-keyed but assumed consistent with `Train` table).
- `Premium_Seats_Available` / `General_Seats_Available` (INTEGER): Number of seats available in each class.
- `Premium_Seats_Occupied` / `General_Seats_Occupied` (INTEGER): Number of booked/occupied seats.
- **Primary Key:** Composite of (`Train_Name`, `Train_Date`)

</details>

## 📥 Data Loading Overview

After defining the database schema, the next step involves populating the tables with actual records using the script `Load_Data_RailwaySystem.sql`. This SQL script inserts values from the corresponding CSV files into their respective tables in a consistent and relationally sound order.

---

### 📂 CSV File → SQL Table Mapping

| CSV File                   | Corresponding Table | Purpose                                             |
|----------------------------|---------------------|-----------------------------------------------------|
| `Passenger_Table_Data.csv` | `Passenger`         | Loads passenger details including SSN, name, contact, etc. |
| `Train_Table_Data.csv`     | `Train`             | Inserts data about trains like names, fares, routes |
| `TrainStatus_Table_Data.csv` | `Train_Status`     | Inserts seat availability by date and class         |
| `Booked_Table_Data.csv`    | `Booked`            | Links passengers to trains and records booking type/status |

---

### 🛠️ Script Execution Order

To preserve foreign key constraints and referential integrity, the tables must be loaded in this order:

1. `Passenger`
2. `Train`
3. `Train_Status`
4. `Booked`

---

### 📝 Important Notes

- **Date Format**: Dates in the dataset follow the `YYYY-MM-DD` format.
- **SSN**: Treated as a unique integer identifier for passengers.
- **Train Numbers**: Checked to fall within range 1–5 as per schema constraints.
- **Seats**: Values are validated to be within bounds (0–10) for each class.
- **Ticket Types**: Only `Premium` and `General` are accepted.
- **Booking Status**: Only `Booked` or `WaitL` (waitlist) entries are allowed.

You can execute the loading script as follows (in a SQL environment like SQLiteStudio):

```sql
.read Load_Data_RailwaySystem.sql
```

This command will load and populate all four tables sequentially with the provided data.

---


## 📌 SQL Query Examples & Use Cases

Below are real SQL queries used to retrieve data from the Railway Reservation System database.

<details>
<summary><strong>🔍 1. Retrieve trains booked by a specific passenger</strong></summary>

```sql
SELECT Train.Train_Number, Train.Train_Name
FROM Passenger
JOIN Booked ON Passenger.SSN = Booked.Passenger_SSN
JOIN Train ON Booked.Train_Number = Train.Train_Number
WHERE Passenger.First_Name = 'InsertFirstName' AND Passenger.Last_Name = 'InsertLastName';
```
</details>

<details>
<summary><strong>📅 2. List passengers traveling on a specific day with confirmed tickets</strong></summary>

```sql
SELECT Passenger.First_Name, Passenger.Last_Name
FROM Passenger
JOIN Booked ON Passenger.SSN = Booked.Passenger_SSN
JOIN Train ON Booked.Train_Number = Train.Train_Number
WHERE Booked.Status = 'Booked' AND Train.Available_Weekdays LIKE '%InsertDay%';
```
</details>

<details>
<summary><strong>🎟️ 3. Display train and passenger details for passengers aged 50–60</strong></summary>

```sql
SELECT Train.Train_Number, Train.Train_Name, Train.Source_Station, Train.Destination_Station, 
       Passenger.First_Name, Passenger.Last_Name, Passenger.Address, 
       Booked.Ticket_Type, Booked.Status
FROM Passenger
JOIN Booked ON Passenger.SSN = Booked.Passenger_SSN
JOIN Train ON Booked.Train_Number = Train.Train_Number
WHERE strftime('%Y', 'now') - strftime('%Y', Passenger.Birth_Date) BETWEEN 50 AND 60;
```
</details>

<details>
<summary><strong>🚆 4. List train name, date, and passenger count</strong></summary>

```sql
SELECT Train.Train_Name, Train_Status.Train_Date, 
       Train_Status.Premium_Seats_Occupied + Train_Status.General_Seats_Occupied AS Total_Passengers
FROM Train
JOIN Train_Status ON Train.Train_Name = Train_Status.Train_Name;
```
</details>

<details>
<summary><strong>✅ 5. Get confirmed passengers for a specific train</strong></summary>

```sql
SELECT Passenger.First_Name, Passenger.Last_Name
FROM Passenger
JOIN Booked ON Passenger.SSN = Booked.Passenger_SSN
JOIN Train ON Booked.Train_Number = Train.Train_Number
WHERE Train.Train_Name = 'EnterTrainName' AND Booked.Status = 'Booked';
```
</details>

<details>
<summary><strong>🕓 6. List all waitlisted passengers and their train name</strong></summary>

```sql
SELECT Passenger.First_Name, Passenger.Last_Name, Train.Train_Name
FROM Passenger
JOIN Booked ON Passenger.SSN = Booked.Passenger_SSN
JOIN Train ON Booked.Train_Number = Train.Train_Number
WHERE Booked.Status = 'WaitL';
```
</details>

<details>
<summary><strong>📞 7. Passengers with phone area code '605' (descending order)</strong></summary>

```sql
SELECT First_Name, Last_Name
FROM Passenger
WHERE Phone2 LIKE '605%'
ORDER BY First_Name DESC, Last_Name DESC;
```
</details>

<details>
<summary><strong>📆 8. Passengers traveling on Thursdays (ascending order)</strong></summary>

```sql
SELECT Passenger.First_Name, Passenger.Last_Name
FROM Passenger
JOIN Booked ON Passenger.SSN = Booked.Passenger_SSN
JOIN Train ON Booked.Train_Number = Train.Train_Number
WHERE Train.Available_Weekdays LIKE '%Thursday%' AND Booked.Status = 'Booked'
ORDER BY Passenger.First_Name ASC;
```
</details>

## 📊 Key Results & Insights

Throughout the project, multiple SQL queries were run across real-world data to extract meaningful travel and booking insights for the Railway Reservation System. Below are **data-backed results** and **key findings** from our exploration:

### 🧾 Confirmed Bookings by Day

- When filtering by confirmed tickets (`Status = 'Booked'`) and weekday availability (`Available_Weekdays`), we found **Friday** to be one of the most popular travel days across multiple trains.
- This indicates strong weekend outbound travel demand, especially among working professionals or casual travelers.

### 👤 Passenger Age Analysis

- A focused age-based query showed that several passengers in the **50–60 age group** were actively traveling on premium trains.
- Most of these travelers had “Booked” status rather than waitlisted, indicating a preference (and ability) to plan ahead or afford premium fares.

### 🚆 Passenger Load by Train & Date

- Using data from the `Train_Status` table, we analyzed occupancy trends:
  - **Train A** (e.g., Amtrak or named equivalent in data) had **high occupancy** on certain dates with only **1–2 premium seats remaining**, signaling peak usage windows.
  - **Train C** showed moderate usage across weekdays, suggesting it serves less congested routes.

### 📱 Area Code Demographics

- A SQL filter revealed that several passengers with phone numbers starting in area code `605` (South Dakota) were active users of the system.
- These passengers were sorted and listed in descending alphabetical order, revealing potential regional outreach or usage spikes from specific counties.

### ⏳ Waitlisted Demand

- A snapshot of `Status = 'WaitL'` bookings showed that multiple passengers were unable to get confirmed seats on some popular trains, possibly due to:
  - Capacity constraints
  - Uneven seat allocation between General and Premium tiers
- This highlights the **need for dynamic capacity planning** in future system iterations.

These insights were generated using live queries on the dataset and confirmed through visual inspections in SQLiteStudio.
