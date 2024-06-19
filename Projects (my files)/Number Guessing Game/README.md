# Number Guessing Game

## Project Overview

This project is a number guessing game where users can guess a randomly generated number between 1 and 1000. The game tracks the user's number of guesses, stores the user's best game statistics, and maintains a record of all games played in a PostgreSQL database.

## Features
- User registration and login
- Random number generation for the game
- User statistics tracking
  - Total games played
  - Best game (fewest guesses)
- Input validation
- Persistent data storage using PostgreSQL

## What I Learned

### Bash Scripting

- **Input Handling:** I learned how to read user input using `read` and validate it within a loop.
- **Conditional Statements:** I used `if-else` statements to handle different user scenarios and input validation.
- **Loops:** Implemented recursive functions to handle repeated guessing until the correct number is guessed.
- **Variable Management:** Managed variables to store and update user statistics during the game.

### PostgreSQL

- **Database Design:** Designed a database schema to store user information and game statistics.
  - **Tables:**
    - `users` table to store user details and statistics.
    - `games` table to store individual game records.
- **SQL Queries:** Learned to write SQL queries to insert, update, and retrieve data.
  - Used `INSERT`, `UPDATE`, `SELECT`, and `FOREIGN KEY` constraints to maintain data integrity.
- **Database Connection:** Established a connection to the PostgreSQL database from a Bash script using the `psql` command-line tool.

### Version Control with Git

- **Repository Initialization:** Initialized a Git repository to track changes in the project.
- **Commits:** Made frequent commits to save progress, with clear and descriptive messages.
  - Followed a structured format for commit messages (e.g., `feat:`, `fix:`, `chore:`, `refactor:`).

### Error Handling and Debugging

- **Input Validation:** Ensured that only valid integers are accepted as guesses.
- **Data Handling:** Managed and cleaned up query results using tools like `xargs` and `sed` to format output correctly.
- **Debugging:** Identified and fixed issues related to empty values and incorrect data types.

## Why This Project Stands Out

This project stands out as one of the better projects I have worked on. It is more challenging than others, containing hidden questions and requiring creative problem-solving. The complexity of integrating Bash scripts with a PostgreSQL database and handling various edge cases provides ample opportunity for learning and growth. I thoroughly enjoyed working on this project and appreciated the space it gave me to be creative.

## Project Files

- `number_guess.sh`: The main Bash script for the number guessing game.
- `number_guess.sql`: The SQL script to set up the database and tables.