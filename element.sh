#!/bin/bash

# Define PSQL variable for querying the database
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Check if an argument is provided
if [ $# -eq 0 ]; then
    echo "Please provide an element as an argument."
else
    # Fetch information about the element from the database
    element_info=$($PSQL "SELECT elements.atomic_number, elements.symbol, elements.name, types.type, properties.atomic_mass, properties.melting_point_celsius, properties.boiling_point_celsius FROM elements JOIN properties ON elements.atomic_number = properties.atomic_number JOIN types ON properties.type_id = types.type_id WHERE elements.atomic_number = '$1' OR elements.symbol = '$1' OR elements.name = '$1';")

    # Check if element information is retrieved
    if [ -n "$element_info" ]; then
        # Output element information
        echo "$element_info" | while IFS='|' read -r atomic_number symbol name type mass melting_point boiling_point; do
            echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $mass amu. $name has a melting point of $melting_point celsius and a boiling point of $boiling_point celsius."
        done
    else
        echo "I could not find that element in the database."
    fi
fi
