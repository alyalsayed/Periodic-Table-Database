# Periodic Table Database

A PostgreSQL-backed database project and shell utility for querying chemical element data. This project was built as part of the freeCodeCamp Relational Database curriculum and includes a normalized periodic table database plus a command-line script to fetch element details by atomic number, symbol, or name.

## Overview

This project includes:

- a PostgreSQL database named `periodic_table`
- normalized tables for elements, properties, and element types
- a Bash script, `element.sh`, that looks up data from the database
- validation rules and data cleanup tasks from the freeCodeCamp project requirements

## Features

- Query an element by atomic number, symbol, or name
- Return detailed element information including:
  - atomic number
  - symbol
  - name
  - element type
  - atomic mass
  - melting point
  - boiling point
- Handle invalid or missing inputs with a friendly error message
- Work with a properly normalized relational database schema

## Project structure

```text
.
├── periodic_table.sql   # Database dump / schema data
├── element.sh           # Bash script to query the database
├── README.md            # Project documentation
└── .gitignore           # Git metadata (if present in your local repo)
```

## Database setup

To connect to the database:

```bash
psql --username=freecodecamp --dbname=periodic_table
```

You can also restore the project database structure and data from the SQL dump:

```bash
psql -U freecodecamp -d periodic_table < periodic_table.sql
```

## Script usage

The script accepts one argument:

- atomic number
- element symbol
- element name

### Examples

```bash
./element.sh 1
./element.sh H
./element.sh Hydrogen
```

### Example output

```text
The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
```

### No argument

```bash
./element.sh
```

Output:

```text
Please provide an element as an argument.
```

### Element not found

```bash
./element.sh 999
```

Output:

```text
I could not find that element in the database.
```

## Script behavior

The `element.sh` script performs the following:

1. checks whether an argument was provided
2. determines whether the input is an atomic number, element symbol, or name
3. runs a SQL query against the `periodic_table` database
4. prints the matching element details
5. returns a clear error when no matching element exists

## Database design notes

The database is normalized to include separate tables for:

- `elements`
- `properties`
- `types`

This design reduces duplication and keeps the element information consistent and maintainable.

## Requirements covered by this project

The project implements the expected freeCodeCamp tasks, including:

- renaming and normalizing columns
- adding unique and not-null constraints
- creating a `types` table and linking it through `type_id`
- updating element values and formatting
- adding missing elements
- creating a CLI script for querying the database

## Local development and validation

To validate the script locally:

```bash
chmod +x element.sh
./element.sh 1
./element.sh H
./element.sh Oxygen
./element.sh 999
```

## License

This project is released under the MIT license.

## Related

- freeCodeCamp Relational Database
- Periodic Table Database project
