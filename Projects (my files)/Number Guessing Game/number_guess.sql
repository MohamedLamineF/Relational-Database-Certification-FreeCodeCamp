create database number_guess;

\c number_guess

create table
  users (
    user_id serial Primary key,
    username varchar(22),
    games_played int default 0,
    best_game int default 0
  );

create table
  games (
    game_id serial primary key,
    user_id INT,
    guesses INT NOT NULL,
    CONSTRAINT game_user FOREIGN KEY (user_id) REFERENCES users (user_id)
  );

INSERT INTO
  users (username)
values
  ('lamine');