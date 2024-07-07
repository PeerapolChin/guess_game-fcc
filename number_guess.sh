#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
GUESS_TIMES=1
SERCRET_NUMBER=$((1 + $RANDOM % 1000))
echo "Enter your username:"
read NAME
CHECK_USER=$($PSQL "SELECT name FROM username WHERE name='$NAME'")
# if username has not been uesd before
if [[ -z $CHECK_USER ]]
then
INSERT_NEW_USER=$($PSQL "INSERT INTO username(name,total_game) VALUES('$NAME',0)")
GET_NEW_USER=$($PSQL "SELECT name FROM username WHERE name='$NAME'")
echo "Welcome, $GET_NEW_USER! It looks like this is your first time here."
# if username has been uesd before
else
ALL_GAME_TIMES=$($PSQL "SELECT total_game FROM username WHERE name='$NAME'")
USER_ID=$($PSQL "SELECT user_id FROM username WHERE name='$NAME'")
FEWEST_GUESS_TIME=$($PSQL "SELECT MIN(guess_times) FROM game WHERE user_id='$USER_ID'")
echo "Welcome back, $CHECK_USER! You have played $ALL_GAME_TIMES games, and your best game took $FEWEST_GUESS_TIME guesses."
fi
echo "Guess the secret number between 1 and 1000:"
# let's guess
GUESS_START(){
read GUESS
# if guess not number
if [[ ! $GUESS =~ ^[0-9]+$ ]]
then
echo "That is not an integer, guess again:"
let GUESS_TIMES=GUESS_TIMES+1
GUESS_START
# if guess is number 
else
    # if guess is sercret number
    if [[ $GUESS == $SERCRET_NUMBER ]]
    then
    echo "You guessed it in $GUESS_TIMES tries. The secret number was $SERCRET_NUMBER. Nice job!"
    GET_USER_ID=$($PSQL "SELECT user_id FROM username WHERE name='$NAME'")
    INSERT_GUESS_TIMES=$($PSQL "INSERT INTO game(user_id,guess_times) VALUES($GET_USER_ID,$GUESS_TIMES)")

    OLD_TOTAL_GAME=$($PSQL "SELECT total_game FROM username WHERE name='$NAME'")
    let OLD_TOTAL_GAME=OLD_TOTAL_GAME+1
    UPDATE_TOTAL_GAME=$($PSQL "UPDATE username SET total_game=$OLD_TOTAL_GAME WHERE name='$NAME'")

    # if guess is not sercret number
    else
        # if guess higher than sercret number
        if [[ $GUESS -gt $SERCRET_NUMBER ]]
        then
        echo "It's lower than that, guess again:"
        let GUESS_TIMES=GUESS_TIMES+1
        GUESS_START
        # if guess lower than sercret number
        else
        echo "It's higher than that, guess again:"
        let GUESS_TIMES=GUESS_TIMES+1
        GUESS_START
        fi
    fi
fi
}
GUESS_START
#run pass