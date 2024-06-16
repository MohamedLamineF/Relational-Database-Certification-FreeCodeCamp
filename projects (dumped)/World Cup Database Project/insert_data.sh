#! /bin/bash

if [[ $1 == "test" ]]; then
    PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
    PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPOSANT WINNER_GOALS OPPONENT_GOALS; do
    #check if winner (team name) exist in teams table
    WINNER_EXIST_IN_TEAM=$($PSQL "Select name from teams where name='$WINNER'")
    #check if name not exist in team table,
    if [[ -z $WINNER_EXIST_IN_TEAM && $WINNER != 'winner' ]]; then
        #if true add to teams table
        ADD_TO_TEAM=$($PSQL "INSERT INTO teams(name) values('$WINNER')")
        if [[ $ADD_TO_TEAM = 'INSERT 0 1' ]]; then
            echo $WINNER inserted into games
        fi
    fi

    #check if oppostant (team name) exist in teams table
    OPPOSANT_EXIST_IN_TEAM=$($PSQL "Select name from teams where name='$OPPOSANT'")
    #check if name not exist in team table,
    if [[ -z $OPPOSANT_EXIST_IN_TEAM && $OPPOSANT != 'opponent' ]]; then
        #if true add to teams table
        ADD_TO_TEAM=$($PSQL "INSERT INTO teams(name) values('$OPPOSANT')")
        if [[ $ADD_TO_TEAM = 'INSERT 0 1' ]]; then
            echo $OPPOSANT inserted into games
        fi
    fi

    #fill games table
    if [[ $YEAR != 'year' ]]; then
        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPOSANT'")
        ADD_TO_GAMES=$($PSQL "INSERT INTO games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) VALUES($YEAR, '$ROUND', $WINNER_GOALS, $OPPONENT_GOALS, $WINNER_ID, $OPPONENT_ID)")
        if [[ $ADD_TO_GAMES = 'INSERT 0 1' ]]; then
            echo row inserted into games
        fi
    fi
done
