# Learn SQL by Building a Student Database - Part 1

This course, part of the freeCodeCamp curriculum (Relational database).
Below is a summary of the steps involved in the course, which you can follow along to build your own student database. You can find my code for this tutorial in this repository.

## Course Summary

1. **Examine CSV Files:**
   - You begin with two CSV files containing information about students, courses, and majors.

2. **Set Up PostgreSQL Database:**
   - Log into the PostgreSQL interactive terminal using `psql --username=freecodecamp --dbname=postgres`.
   - Create a new database named `students`.

3. **Create Tables:**
   - Create tables for students, majors, courses, and a junction table for majors and courses:
     - **students**: Includes columns for student ID, first name, last name, major ID, and GPA.
     - **majors**: Contains major ID and major name.
     - **courses**: Contains course ID and course name.
     - **majors_courses**: A junction table containing major ID and course ID as a composite primary key.

4. **Define Columns and Constraints:**
   - Add appropriate columns to each table and define primary keys and foreign keys.

5. **Insert Data from CSV Files:**
   - Create a Bash script (`insert_data.sh`) to automate the insertion of data from the CSV files into the database.

6. **Data Insertion Process:**
   - Loop through the CSV files to insert majors, courses, and students into the respective tables.
   - Use checks to avoid duplicate entries and ensure data integrity.

7. **Verify Database Structure and Data:**
   - Continuously verify the structure and content of the tables using SQL commands.

8. **Generate Database Dump:**
   - Use the `pg_dump` command to create a backup of the database in a `students.sql` file.

## Using the Repository
You can find the complete code for this tutorial in this repository. The repository includes the CSV files, the Bash script (`insert_data.sh`), and the SQL dump file (`students.sql`).