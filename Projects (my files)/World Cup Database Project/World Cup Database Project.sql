-- psql --username=freecodecamp --dbname=postgres
-- create database
create database worldcup;
-- connect to database worldcup
\c worldcup;
-- create temas table
create table teams(
  team_id SERIAL PRIMARY KEY NOT NULL,
  name varchar(50) unique NOT NULL
);
-- create games table
create table games(
  game_id SERIAL PRIMARY KEY NOT NULL,
  year INT NOT NULL,
  round varchar(50) NOT NULL,
  winner_goals INT NOT NULL, 
  opponent_goals INT NOT NULL,
  winner_id INT NOT NULL,
  opponent_id INT NOT NULL,
  CONSTRAINT fk_winner_team FOREIGN KEY (winner_id) REFERENCES teams(team_id),
  CONSTRAINT fk_opponent_team FOREIGN KEY (opponent_id) REFERENCES teams(team_id)
);

-- give executable permissions to my sh file
-- chmod +x insert_data.sh queries.sh
