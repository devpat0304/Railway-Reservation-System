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

## 🗃️ Database Schema & Table Overview

The Railway Reservation System is composed of four primary tables, each representing a core entity in the reservation workflow:

<details>
  <summary><strong>👤 Passenger</strong></summary>

- **Purpose:** Stores passenger demographic and identification details.
- **Key Attributes:**
  - `SSN` (Primary Key): Unique identifier for each passenger.
  - `Name`: Full name of the passenger.
  - `Age`: Age in years.
  - `Gender`: Male/Female/Other.
  - `Phone`: Contact number.
</details>

<details>
  <summary><strong>🚆 Train</strong></summary>

- **Purpose:** Holds train-specific information.
- **Key Attributes:**
  - `TrainNumber` (Primary Key): Unique ID for each train.
  - `TrainName`: Name of the train.
  - `Source`: Departure station.
  - `Destination`: Arrival station.
  - `Distance`: Distance between source and destination.
</details>

<details>
  <summary><strong>📅 TrainStatus</strong></summary>

- **Purpose:** Tracks seat availability and travel dates for trains.
- **Key Attributes:**
  - `TrainNumber` (Foreign Key → Train)
  - `DateOfTravel`: Date on which the train runs.
  - `SeatsAvailable`: Number of seats available on that date.
  - **Primary Key:** (`TrainNumber`, `DateOfTravel`)
</details>

<details>
  <summary><strong>🎫 Booked</strong></summary>

- **Purpose:** Records bookings made by passengers.
- **Key Attributes:**
  - `TicketType`: e.g., Confirmed, Waiting List.
  - `TrainNumber` (Foreign Key → Train)
  - `DateOfTravel` (Foreign Key → TrainStatus)
  - `SSN` (Foreign Key → Passenger)
  - `Status`: Booking status (Confirmed/Cancelled).
  - **Primary Key:** Composite of (`TicketType`, `TrainNumber`, `DateOfTravel`, `SSN`)
</details>
