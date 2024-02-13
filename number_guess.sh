#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$((RANDOM % 1000 + 1))
NUMBER_OF_GUESSES=0

echo "Enter your username:"
read USERNAME_INPUT

# FIND USER // OR WELCOME NEW USER
RESULT=$($PSQL "SELECT * FROM usern_info WHERE username='$USERNAME_INPUT'")
if [[ -z $RESULT ]]
then
echo "Welcome, $USERNAME_INPUT! It looks like this is your first time here."
else
echo $RESULT | while IFS='|' read -r USER_ID USERNAME GAMES_PLAYED BEST_GAME
do
echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
done
fi


GUESSING_FUNCTION() {
NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1))

if [[ -z $1 ]]; then
  echo "Guess the secret number between 1 and 1000:"
  read GUESSED_NUMBER
else
  echo $1
  read GUESSED_NUMBER
fi

if [[ ! $GUESSED_NUMBER =~ ^[0-9]+$ ]]
then
GUESSING_FUNCTION "That is not an integer, guess again:"
fi

if [[ $GUESSED_NUMBER -ne $RANDOM_NUMBER ]]
then
  if [[ $GUESSED_NUMBER -lt $RANDOM_NUMBER ]]
  then
  GUESSING_FUNCTION "It's higher than that, guess again:"
  else
  GUESSING_FUNCTION "It's lower than that, guess again:"
  fi
else

  if [[ -z $RESULT ]]
  then
  $PSQL "INSERT INTO usern_info(username, games_played, best_game) VALUES('$USERNAME_INPUT', 1, $NUMBER_OF_GUESSES)" > /dev/null 2>&1
  else

  BEST_GAME=$($PSQL "SELECT best_game FROM usern_info WHERE username='$USERNAME_INPUT'")
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM usern_info WHERE username='$USERNAME_INPUT'")
  GAMES_PLAYED=$(($GAMES_PLAYED + 1))

    if [[ $NUMBER_OF_GUESSES -lt $BEST_GAME ]]
    then
    $PSQL "UPDATE usern_info SET games_played=$GAMES_PLAYED, best_game=$NUMBER_OF_GUESSES WHERE username='$USERNAME_INPUT'" > /dev/null 2>&1
    else
    $PSQL "UPDATE usern_info SET games_played=$GAMES_PLAYED WHERE username='$USERNAME_INPUT'" > /dev/null 2>&1
    fi

  fi
echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
fi
}

GUESSING_FUNCTION