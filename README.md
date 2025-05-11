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
