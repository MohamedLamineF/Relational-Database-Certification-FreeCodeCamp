# Periodic Table Database Project

## Overview

This project involved working with a PostgreSQL database to manage and query information about chemical elements. The tasks included fixing database structure issues, creating a version-controlled bash script, and writing a script to query the database. This project is part of the FreeCodeCamp Relational Database Certification.

## What I Learned

### Database Fixes and Modifications

1. **Renaming Columns**
   - Renamed the `weight` column to `atomic_mass`.
   - Renamed the `melting_point` column to `melting_point_celsius`.
   - Renamed the `boiling_point` column to `boiling_point_celsius`.

2. **Adding Constraints**
   - Added `NOT NULL` and `UNIQUE` constraints to the `symbol` and `name` columns in the `elements` table.
   - Made the `melting_point_celsius` and `boiling_point_celsius` columns not accept null values.

3. **Foreign Key**
   - Set the `atomic_number` column in the `properties` table as a foreign key referencing the same column in the `elements` table.

4. **Types Table**
   - Created a `types` table to store the different types of elements.
   - The `types` table includes a `type_id` column as an integer and primary key, and a `type` column as a non-null `VARCHAR`.
   - Added rows to the `types` table to represent the different types from the `properties` table.
   - Added a `type_id` foreign key column to the `properties` table, linking it to the `types` table.

5. **Data Formatting**
   - Capitalized the first letter of all `symbol` values in the `elements` table.
   - Removed trailing zeros from the `atomic_mass` column to ensure accurate representation.

### Adding New Elements

- Added Fluorine (atomic number 9) and Neon (atomic number 10) to the database, including their respective properties.

### Git and Version Control

1. **Initializing Git Repository**
   - Created a `periodic_table` folder and initialized it as a Git repository.
   - Ensured the repository has a `main` branch with all commits.

2. **Commits**
   - Made at least five commits with appropriate commit messages (`fix:`, `feat:`, `refactor:`, `chore:`, or `test:`).

### Bash Script for Querying Database

1. **Script Creation**
   - Created an `element.sh` script that queries the database based on an atomic number, symbol, or name of an element.
   - Ensured the script has executable permissions.

2. **Functionality**
   - The script outputs information about the given element when an atomic number, symbol, or name is provided.
   - If the argument doesn't match any element in the database, it outputs `I could not find that element in the database`.

## How to Use the Project

### Prerequisites

- PostgreSQL installed and running.
- Bash shell for running the script.
- Git for version control.

### Setup

1. **Clone the Repository**

   Clone the repository and navigate to the `periodic_table` directory.

2. **Import the Database**

   If you have a dump of the database (`periodic_table.sql`), you can import it using PostgreSQL.

3. **Run the Script**

   Ensure the `element.sh` script has executable permissions and run it with an appropriate argument (atomic number, symbol, or name of an element).
