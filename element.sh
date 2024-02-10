#!/bin/bash
# if no argument is provided
if [ $# -eq 0 ]; then
    echo "Please provide an element as an argument."
fi

# Define PSQL variable for querying the database
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
