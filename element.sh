#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
        echo "Please provide an element as an argument."
else
        if [[ $1 =~ ^[0-9]+$ ]]
        then
            ID_RESULT=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $1")
            # echo atomic_number $ID_RESULT
        elif [[ ${#1} -le 2 ]]
        then
          ID_RESULT=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1'")
          # echo symbol $ID_RESULT
        else
          ID_RESULT=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$1'")
          # echo name $ID_RESULT
          
        fi
  if [[ -z $ID_RESULT ]]
  then
    echo "I could not find that element in the database."
  else
    QUERY_RESULT=$($PSQL "SELECT symbol, name, atomic_mass, type, melting_point_celsius, boiling_point_celsius FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id) WHERE atomic_number = $ID_RESULT")
    echo $QUERY_RESULT | while IFS="|" read SYMBOL NAME ATOMIC_MASS TYPE MELTING_POINT BOILING_POINT
    do
      echo "The element with atomic number $ID_RESULT is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  #   NUMBER BAR SYMBOL BAR NAME BAR 
  fi
fi
