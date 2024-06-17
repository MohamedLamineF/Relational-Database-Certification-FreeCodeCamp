# Salon Appointment Scheduler

This project is a simple Bash script that allows users to book appointments at a salon. The script interacts with a PostgreSQL database to manage customers, services, and appointments. Below is an overview of the skills and concepts I learned while completing this project.

## What I Learned

### Bash Scripting

- **Shebang and Permissions**: I learned how to use a shebang (`#!/bin/bash`) to specify the script interpreter and how to make a script executable using `chmod +x`.
- **User Interaction**: I used `echo` to display messages and `read` to capture user input.
- **Conditional Statements**: I utilized `if-else` statements to handle various conditions, such as checking if a service exists or if a customer is already in the database.
- **Loops**: I employed `while` loops to iterate through the list of services and display them to the user.

### PostgreSQL

- **Database Creation and Connection**: I learned how to create and connect to a PostgreSQL database using `psql` commands.
- **Table Creation**: I created tables with primary and foreign key constraints to enforce relationships between customers, services, and appointments.
- **Data Insertion and Retrieval**: I used SQL queries to insert new records into tables and retrieve data based on user input.
- **Constraints**: I applied constraints to ensure data integrity, such as unique constraints on the `phone` field in the `customers` table.

### Project Requirements

- **Automated Database Initialization**: The script automatically sets up the necessary database and tables if they do not exist.
- **User-friendly Interface**: The script displays a list of available services and guides the user through the process of booking an appointment.
- **Data Persistence**: Customer and appointment data are stored in the PostgreSQL database, allowing for data persistence across multiple script executions.

### Key Learnings

1. **Database Schema Design**: I learned to design a database schema that reflects the relationships between different entities (customers, services, and appointments).
2. **Error Handling**: I implemented basic error handling to manage cases where user input does not match expected values (e.g., selecting a non-existent service).
3. **SQL Integration with Bash**: I learned to integrate SQL queries within a Bash script to perform database operations dynamically based on user input.
4. **Data Integrity**: By using foreign keys and constraints, I ensured that the database maintains referential integrity, preventing orphan records and duplicate entries.

## Repository Contents

- **salon.sql**: SQL script to create and initialize the database schema and tables.
- **salon.sh**: Bash script to manage the salon appointments.


### Conclusion
This project helped me develop a deeper understanding of Bash scripting, PostgreSQL, and how to integrate them to build a functional application. The process of creating tables, managing user input, and ensuring data integrity provided valuable hands-on experience with both shell scripting and SQL.
