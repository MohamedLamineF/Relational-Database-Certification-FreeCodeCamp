#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
if [[ ! $1 ]]; then
    echo "Please provide an element as an argument."
else
    if [[ $1 =~ ^[0-9]+$ ]]; then
        QUERY=$($PSQL "Select e.atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius from elements e join properties p on e.atomic_number=p.atomic_number join types t on t.type_id=p.type_id where e.atomic_number=$1")
    else
        QUERY=$($PSQL "Select e.atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius from elements e join properties p on e.atomic_number=p.atomic_number join types t on t.type_id=p.type_id where  e.symbol='$1' OR e.name='$1'")
    fi
    if [[ -z $QUERY ]]; then
        echo "I could not find that element in the database."
    else
        echo "$QUERY" | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR ATOMIC_MASS BAR MELTING BAR BOILING; do
            echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
        done
    fi
fi
