#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"
RANDOMNUMBER=$(($RANDOM % 4 + 1))

echo "Enter your username:"
read USERNAME

# Check if username exists
CHECK_USERNAME=$($PSQL "SELECT user_id, username, games_played, best_game FROM users WHERE username='$USERNAME'")
if [[ -z $CHECK_USERNAME ]]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # Insert new user into users table
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  # Get the new user's id
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  USER_ID=$(echo $USER_ID | xargs)
else
  # Format and read values from query result
  IFS='|' read -r USER_ID USERNAME GAMEPLAYED BESTGAME <<<"$(echo $CHECK_USERNAME | sed 's/|/|/g')"
  USER_ID=$(echo $USER_ID | xargs)
  USERNAME=$(echo $USERNAME | xargs)
  GAMEPLAYED=$(echo $GAMEPLAYED | xargs)
  BESTGAME=$(echo $BESTGAME | xargs)
  echo "Welcome back, $USERNAME! You have played $GAMEPLAYED games, and your best game took $BESTGAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"

NUMBER_OF_GUESSES=0

GUESS_NUMBER() {
  read GUESSEDNUMBER
  ((NUMBER_OF_GUESSES++))
  if [[ ! $GUESSEDNUMBER =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    GUESS_NUMBER
  else
    if [[ $GUESSEDNUMBER -eq $RANDOMNUMBER ]]; then
      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOMNUMBER. Nice job!"
      # Update user stats
      UPDATE_GAME_STATS=$($PSQL "UPDATE users SET games_played = games_played + 1, best_game = CASE WHEN best_game = 0 THEN $NUMBER_OF_GUESSES ELSE LEAST(best_game, $NUMBER_OF_GUESSES) END WHERE user_id = $USER_ID")
      # Insert game result
      INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES)")
    else
      if [[ $GUESSEDNUMBER -gt $RANDOMNUMBER ]]; then
        echo "It's lower than that, guess again:"
        GUESS_NUMBER
      else
        echo "It's higher than that, guess again:"
        GUESS_NUMBER
      fi
    fi
  fi
}

GUESS_NUMBER
