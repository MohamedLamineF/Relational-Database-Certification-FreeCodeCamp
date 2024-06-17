# World Cup Database Project

This project involves creating a database to store information about the final three rounds of the World Cup tournaments since 2014.we will create a PostgreSQL database, insert data from a CSV file, and query the database to retrieve specific information. This README file provides instructions on how to complete the project.

## Table of Contents
1. [Project Structure](#project-structure)
2. [Part 1: Create the Database](#part-1-create-the-database)
3. [Part 2: Insert the Data](#part-2-insert-the-data)
4. [Part 3: Query the Database](#part-3-query-the-database)
5. [Submission Instructions](#submission-instructions)


## Project Structure
The project contains the following files:

- `games.csv`: Contains data about the World Cup games.
- `insert_data.sh`: Script to insert data from `games.csv` into the database.
- `queries.sh`: Script to query the database and produce the required output.
- `expected_output.txt`: Contains the expected output for the queries.

## Part 1: Create the Database

1. Log into the psql interactive terminal:

2. Create the `worldcup` database:

3. Connect to the `worldcup` database:

4. Create the `teams` and `games` tables with the required structure:

## Part 2: Insert the Data

1. Make sure `insert_data.sh` has executable permissions:

2. Complete the `insert_data.sh` script to insert data from `games.csv` into the database. Use the `PSQL` variable defined in the script to make database queries:

3. Ensure the following:
   - All unique teams are added to the `teams` table.
   - Each line from `games.csv` (excluding the header) is added to the `games` table.

## Part 3: Query the Database

1. Make sure `queries.sh` has executable permissions:

2. Complete the empty `echo` commands in the `queries.sh` script to produce output that matches `expected_output.txt`. Use the `PSQL` variable defined in the script to make database queries:

## Submission Instructions

After getting all tests to pass, follow these steps:

1. Save a dump of your database:
   ```bash
   pg_dump -cC --inserts -U freecodecamp worldcup > worldcup.sql
   ```

2. Save the `worldcup.sql` file, as well as the final versions of `insert_data.sh` and `queries.sh`, in a public repository.

3. Submit the URL to the repository on freeCodeCamp.org.

