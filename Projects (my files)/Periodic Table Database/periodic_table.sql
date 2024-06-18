-- You should rename the weight column to atomic_mass
alter table properties rename column weight to atomic_mass;

-- You should rename the melting_point column to melting_point_celsius and the boiling_point column to boiling_point_celsius
alter table properties rename column melting_point to melting_point_celsius;
alter table properties rename column boiling_point to boiling_point_celsius;

-- Your melting_point_celsius and boiling_point_celsius columns should not accept null values
alter table properties alter melting_point_celsius set not null;
alter table properties alter boiling_point_celsius set not null;

-- You should add the UNIQUE constraint to the symbol and name columns from the elements table
ALTER TABLE elements ADD CONSTRAINT unique_symbol UNIQUE (symbol);

ALTER TABLE elements ADD CONSTRAINT unique_name UNIQUE (name);

-- Your symbol and name columns should have the NOT NULL constraint
alter table elements alter symbol set not null;
alter table elements alter name set not null;

-- You should set the atomic_number column from the properties table as a foreign key that references the column of the same name in the elements table
alter table properties add foreign key (atomic_number) references elements (atomic_number);

-- You should create a types table that will store the three types of elements
create table types ();

-- Your types table should have a type_id column that is an integer and the primary key
alter table types add column type_id int primary key;

-- Your types table should have a type column that's a VARCHAR and cannot be null. It will store the different types from the type column in the properties table
alter table types add column type varchar(50) not null;

-- You should add three rows to your types table whose values are the three different types from the properties table
insert into types (type_id, type) values (1, 'nonmetal'), (2, 'metal'),  (3, 'metalloid');

-- Your properties table should have a type_id foreign key column that references the type_id column from the types table. It should be an INT with the NOT NULL constraint
alter table properties add column type_id int;

alter table properties add foreign key (type_id) references types (type_id);

-- Each row in your properties table should have a type_id value that links to the correct type from the types table
update properties set type_id = 1 where type = 'nonmetal';

update properties set type_id = 2 where type = 'metal';

update properties set type_id = 3 where type = 'metalloid';

alter table properties alter type_id set not null;

-- You should capitalize the first letter of all the symbol values in the elements table. Be careful to only capitalize the letter and not change any others
UPDATE elements SET symbol = INITCAP (symbol);

-- You should remove all the trailing zeros after the decimals from each row of the atomic_mass column. You may need to adjust a data type to DECIMAL for this. The final values they should be are in the atomic_mass.txt file
ALTER TABLE properties ALTER COLUMN atomic_mass TYPE decimal;
UPDATE properties SET atomic_mass = CAST(atomic_mass AS REAL)::numeric;

-- You should add the element with atomic number 9 to your database. Its name is Fluorine, symbol is F, mass is 18.998, melting point is -220, boiling point is -188.1, and it's a nonmetal
insert into elements(atomic_number,symbol,name) values(9,'F','Fluorine');
insert into properties(atomic_number,type,atomic_mass,melting_point_celsius,boiling_point_celsius,type_id) values(9,'nonmetal',18.998,-220,-188.1,1);

-- You should add the element with atomic number 10 to your database. Its name is Neon, symbol is Ne, mass is 20.18, melting point is -248.6, boiling point is -246.1, and it's a nonmetal
insert into elements(atomic_number,symbol,name) values(9,'F','Fluorine');
insert into properties(atomic_number,type,atomic_mass,melting_point_celsius,boiling_point_celsius,type_id) values(9,'nonmetal',18.998,-220,-188.1,1);

-- You should delete the non existent element, whose atomic_number is 1000, from the two tables
delete from properties  where atomic_number=1000;
delete from elements where atomic_number=1000;

-- Your properties table should not have a type column
alter table properties  drop column type;
