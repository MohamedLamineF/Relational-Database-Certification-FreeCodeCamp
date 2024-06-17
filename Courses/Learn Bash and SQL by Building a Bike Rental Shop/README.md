
# Learn Bash and SQL by Building a Bike Rental Shop

This course is a script to manage a bike rental shop using a PostgreSQL database. The script allows users to rent and return bikes while updating the database accordingly.

## Table of Contents
- [Summary](#summary)
- [Setup](#setup)
- [Lessons Learned](#lessons-learned)
  - [Bash Scripting](#bash-scripting)
  - [PostgreSQL Database Management](#postgresql-database-management)
  - [SQL Queries](#sql-queries)
  - [Database Design](#database-design)
  - [User Interaction](#user-interaction)

## Summary
The Bike Rental Shop Script is a Bash script designed to manage bike rentals. It interacts with a PostgreSQL database to track bike availability, customer information, and rental records. The script features a main menu with options to rent a bike, return a bike, or exit the program.

## Setup
2. Create the database tables:
    ```sql
    CREATE TABLE customers (
      customer_id SERIAL PRIMARY KEY,
      name VARCHAR(50),
      phone VARCHAR(15) UNIQUE
    );

    CREATE TABLE bikes (
      bike_id SERIAL PRIMARY KEY,
      type VARCHAR(50),
      size INT,
      available BOOLEAN DEFAULT TRUE
    );

    CREATE TABLE rentals (
      rental_id SERIAL PRIMARY KEY,
      customer_id INT REFERENCES customers(customer_id),
      bike_id INT REFERENCES bikes(bike_id),
      date_rented date DEFAULT now(),
      date_returned date
    );
    ```
3. Insert initial bike data:
    ```sql
    INSERT INTO bikes (type, size) VALUES ('Mountain', 28), ('Mountain', 29), ('Road', 27), ('Road', 28), ('Road', 29), ('BMX', 19), ('BMX', 20), ('BMX', 21);
    ```

## Lessons Learned

### Bash Scripting
- **Script Structure**: Learned how to structure a Bash script with functions for different tasks, such as the main menu and specific options like renting and returning bikes.
- **User Input Handling**: Gained experience in prompting the user for input, validating responses, and handling different user scenarios.
- **Conditional Statements**: Improved understanding of using conditional statements to control the flow of the script based on user inputs and database query results.

### PostgreSQL Database Management
- **Database Setup**: Learned how to set up a PostgreSQL database, create tables, and define relationships between tables.
- **Database Connections**: Practiced connecting to a PostgreSQL database from a Bash script and executing SQL commands within the script.
- **Transaction Management**: Understood the importance of transactions in database operations to maintain data integrity during bike rentals and returns.

### SQL Queries
- **Data Retrieval**: Gained proficiency in writing SQL queries to retrieve data from multiple tables, such as listing available bikes or finding a customer’s current rentals.
- **Data Manipulation**: Learned to write SQL commands to insert new records, update existing records, and handle complex queries to manage the rental process.
- **Error Handling**: Improved skills in handling errors and exceptions that occur during database operations, ensuring the script can manage issues gracefully.

### Database Design
- **Schema Design**: Learned to design a relational database schema to support the requirements of a bike rental shop, including customer information, bike details, and rental records.
- **Normalization**: Applied database normalization principles to reduce redundancy and improve data integrity.
- **Foreign Keys**: Understood the role of foreign keys in maintaining relationships between tables and ensuring referential integrity.

### User Interaction
- **User Experience**: Focused on creating a user-friendly interface within the terminal, ensuring the prompts and options are clear and intuitive.
- **Feedback and Validation**: Learned the importance of providing feedback to the user after each operation, such as confirming a bike rental or return, and validating user inputs to prevent errors.