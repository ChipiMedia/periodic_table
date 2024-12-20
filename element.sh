#!/bin/bash
# script to look up elements from database
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit
fi

ELEMENT=$1
RESULT=$($PSQL "SELECT * FROM elements WHERE atomic_number = '$ELEMENT' OR symbol = '$ELEMENT' OR name = '$ELEMENT';")
if [[ -z $RESULT ]]
then
  echo "I could not find that element in the database."
else
  echo $RESULT
fi
