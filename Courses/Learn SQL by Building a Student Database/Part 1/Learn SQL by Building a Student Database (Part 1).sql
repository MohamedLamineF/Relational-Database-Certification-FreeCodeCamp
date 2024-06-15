psql --username=freecodecamp --dbname=postgres
-- create database
create database students
-- create tables
create table
    students ();

create table
    majors ();

create table
    courses ();

create table
    majors_courses ();

-- add columns to students table
alter table students
add column student_id SERIAL PRIMARY KEY;

alter table students
add column first_name VARCHAR(50) NOT NULL;

alter table students
add column last_name VARCHAR(50) NOT NULL;

alter table students
add column major_id INT;

alter table students
add column gpa NUMERIC(2, 1);

-- add columns to majours table
alter table majors
add column major_id SERIAL PRIMARY KEY;

alter table majors
add column major VARCHAR(50) NOT NULL;

-- add foreign key to student table
alter table students add foreign key (major_id) references majors (major_id);

-- add column to courses table
alter table courses
add column course_id SERIAL PRIMARY KEY;

alter table courses
add column course VARCHAR(100) NOT NULL;

-- add columns to majors_courses 
alter table majors_courses add major_id INT;

alter table majors_courses add foreign key (major_id) references majors (major_id);

alter table majors_courses add course_id INT;

alter table majors_courses add foreign key (course_id) references courses (course_id);

alter table majors_courses add PRIMARY KEY (major_id, course_id);

-- add first row to majors and courses
insert into
    majors (major)
values
    ('Database Administration');

insert into
    courses (course)
values
    ('Data Structures and Algorithms');

insert into
    majors_courses (major_id, course_id)
values
    (1, 1);

insert into
    students (first_name, last_name, major_id, gpa)
values
    ('Rhea', 'Kellems', 1, 2.5);