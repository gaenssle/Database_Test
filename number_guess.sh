#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

GET_HINT() {
    if [[ $1 =~ ^[0-9]+$ ]]
        then
        if (( $1 < $2 ))
        then
             echo "It's higher than that, guess again:"
        elif (( $1 > $2 ))
        then
            echo "It's lower than that, guess again:"
        fi
    else
        echo "That is not an integer, guess again:"
    fi
}


echo "Enter your username:"
read USERNAME
USER_ENTRY=$($PSQL "SELECT games_played, best_game FROM users WHERE username = '$USERNAME'")
if [[ -z $USER_ENTRY ]]
then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
else
    echo $USER_ENTRY | while IFS="|" read GAMES_PLAYED BEST_GAME
    do
        echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    done
fi

echo "Guess the secret number between 1 and 1000:"
NUMBER=$((1 + $RANDOM % 1000))
echo $NUMBER

GUESS=0
COUNT=0
until [[ $GUESS == $NUMBER ]]
do
  read GUESS
  GET_HINT $GUESS $NUMBER
  (( COUNT++ ))
done


if [[ -z $USER_ENTRY ]]
then
    INSERT=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 1, $COUNT)")
else
    UPDATE=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE username = '$USERNAME'")
    BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username = '$USERNAME'")
    if [[ $COUNT -lt $BEST_GAME ]]
    then
        UPDATE=$($PSQL "UPDATE users SET best_game = $COUNT WHERE username = '$USERNAME'")
    fi
fi

echo "You guessed it in $COUNT tries. The secret number was $NUMBER. Nice job!"
