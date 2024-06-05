INSERT INTO second_table(id, username) VALUES(1, 'Samus');
select * from second_table;
INSERT INTO second_table(id, username) VALUES(2, 'Mario');
select * from second_table;
INSERT INTO second_table(id, username) VALUES(3, 'Luigi');
select * from second_table;

DELETE FROM second_table WHERE username='Luigi';
select * from second_table;
DELETE FROM second_table WHERE username='Mario';
select * from second_table;
DELETE FROM second_table WHERE username='Samus';
select * from second_table;

alter table second_table drop column username;
\d second_table;
alter table second_table drop column id;
\d second_table;
\d
drop table second_table;
drop table first_table;
\l
alter database first_database rename to mario_database;
\l
create table characters();
alter table characters add column character_id serial;
alter table characters add column name VARCHAR(30) NOT NULL;
alter table characters add column homeland VARCHAR(60);
alter table characters add column favorite_color VARCHAR(30);

INSERT INTO characters(name, homeland, favorite_color) VALUES('Mario', 'Mushroom Kingdom','Red');
INSERT INTO characters(name, homeland, favorite_color) VALUES('Luigi', 'Mushroom Kingdom','Green');
INSERT INTO characters(name, homeland, favorite_color) VALUES('Peach', 'Mushroom Kingdom','Pink');
INSERT INTO characters(name, homeland, favorite_color) VALUES('Toadstool', 'Mushroom Kingdom','Red'),('Bowser', 'Mushroom Kingdom','Green');
INSERT INTO characters(name, homeland, favorite_color) VALUES('Daisy', 'Sarasaland','Yellow'),('Yoshi', 'Dinosaur Land','Green');

UPDATE characters SET favorite_color='Orange' WHERE name='Daisy';
UPDATE characters SET  name='Toad' WHERE  favorite_color='Red';
UPDATE characters SET  name='Mario' WHERE character_id = (select min(character_id) from characters);
UPDATE characters SET favorite_color='Blue' where name='Toad';
UPDATE characters SET favorite_color='Yellow' where name='Bowser';
UPDATE characters SET homeland='Koopa Kingdom' where name='Bowser';

Select  * from characters order by character_id;
Alter table characters add primary key(name);

alter table characters drop constraint characters_pkey;
Alter table characters add primary key(character_id);

alter table more_info add column more_info_id serial;
Alter table more_info add primary key(more_info_id);
alter table more_info add column birthday Date;
alter table more_info add column height  INT;
alter table more_info add column weight NUMERIC(4, 1);

ALTER TABLE more_info ADD COLUMN character_id INT REFERENCES characters(character_id );
ALTER TABLE more_info ADD UNIQUE(character_id);
ALTER TABLE more_info ALTER COLUMN character_id SET NOT NULL;
INSERT INTO more_info(birthday, height, weight,character_id) VALUES('1981-07-09',155,64.5,1);
INSERT INTO more_info(birthday, height, weight,character_id) VALUES('1983-07-14',175,48.8,2);
select character_id,name from characters;
INSERT INTO more_info(birthday, height, weight,character_id) VALUES('1985-10-18',173,52.2,3);
SELECT character_id, name FROM characters WHERE name='Toad';
INSERT INTO more_info(birthday, height, weight,character_id) VALUES('1950-01-10',66,35.6,4);
INSERT INTO more_info(birthday, height, weight,character_id) VALUES('1990-10-29',258,300,5);
INSERT INTO more_info(birthday, height, weight,character_id) VALUES('1989-07-31',NULL,NULL,6);
INSERT INTO more_info(birthday, height, weight,character_id) VALUES('1990-04-13',162,59.1,7);

ALTER TABLE more_info rename column height to height_in_cm;
ALTER TABLE more_info rename column weight to weight_in_kg;

create table sounds(sound_id serial primary key);
alter table sounds add column filename varchar(40) NOT NULL UNIQUE;

ALTER TABLE sounds ADD COLUMN character_id INT NOT NULL REFERENCES characters(character_id);
INSERT INTO sounds(filename,character_id) VALUES('its-a-me.wav',1);
INSERT INTO sounds(filename,character_id) VALUES('yippee.wav',1);
INSERT INTO sounds(filename,character_id) VALUES('ha-ha.wav',2);
INSERT INTO sounds(filename,character_id) VALUES('oh-yeah.wav',2);
INSERT INTO sounds(filename,character_id) VALUES('yay.wav',3);
INSERT INTO sounds(filename,character_id) VALUES('mm-hmm.wav',3),('yahoo.wav',1)


CREATE table actions(action_id SERIAL PRIMARY KEY);
alter table actions add column action varchar(20) UNIQUE NOT NULL;
INSERT INTO actions(action) values('run');
INSERT INTO actions(action) values('jump');
INSERT INTO actions(action) values('duck');

create table character_actions();
alter table character_actions add column character_id INT NOT NULL;
ALTER TABLE  character_actions ADD FOREIGN KEY(character_id) REFERENCES characters(character_id);
alter table character_actions add column action_id INT NOT NULL;
ALTER TABLE  character_actions ADD FOREIGN KEY(action_id) REFERENCES actions(action_id);
ALTER TABLE character_actions ADD PRIMARY KEY(character_id, action_id);

INSERT INTO character_actions(character_id, action_id) values(7,1),(7,2),(7,3);
INSERT INTO character_actions(character_id, action_id) values(6,1),(6,2),(6,3);
INSERT INTO character_actions(character_id, action_id) values(5,1),(5,2),(5,3);
INSERT INTO character_actions(character_id, action_id) values(4,1),(4,2),(4,3);
INSERT INTO character_actions(character_id, action_id) values(3,1),(3,2),(3,3);
INSERT INTO character_actions(character_id, action_id) values(2,1),(2,2),(2,3);
INSERT INTO character_actions(character_id, action_id) values(1,1),(1,2),(1,3);

SELECT * FROM characters FULL JOIN more_info ON characters.character_id = more_info.character_id;
SELECT * FROM characters FULL JOIN sounds ON characters.character_id = sounds.character_id;

SELECT * FROM character_actions FULL JOIN actions ON character_actions.action_id = actions.action_id FULL JOIN characters ON characters.character_id = character_actions.character_id;
