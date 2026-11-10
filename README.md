# Periodic Table Database

A PostgreSQL-backed project that stores periodic table data in a normalized relational schema and exposes it through a small Bash command-line utility.

This repository was created as part of the freeCodeCamp Relational Database curriculum and demonstrates how to design a database, load structured data, and query it using SQL from a shell script.

## Overview

The project includes:

- a PostgreSQL database named `periodic_table`
- normalized tables for element metadata and properties
- an `element.sh` script for querying elements by atomic number, symbol, or name
- an SQL dump file that creates the schema and inserts the data

## Project structure

```text
.
├── README.md               # Project documentation
├── element.sh              # Bash script for querying the database
├── periodic_table.sql      # PostgreSQL schema and data dump
└── .gitignore              # Git metadata (if present locally)
```

## Features

- Query element details by atomic number, symbol, or name
- Return key properties such as:
  - atomic number
  - symbol
  - element name
  - category/type
  - atomic mass
  - melting point
  - boiling point
- Use a normalized relational database design instead of storing all data in a single table
- Handle missing or invalid inputs with a friendly CLI message

## Prerequisites

Before running the project, make sure you have:

- PostgreSQL installed and running
- `psql` available in your PATH
- Bash available on a Unix-like system

## Database setup

From the project root, restore the provided database dump:

```bash
psql -U postgres < periodic_table.sql
```

This creates the `periodic_table` database and loads the schema and sample data.

If you want to connect manually after setup:

```bash
psql --username=freecodecamp --dbname=periodic_table
```

## Script usage

Make the script executable:

```bash
chmod +x element.sh
```

Run it with an atomic number, element symbol, or element name:

```bash
./element.sh 1
./element.sh H
./element.sh Hydrogen
```

### Example output

```text
The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
```

### Missing or invalid input

```bash
./element.sh
```

Output:

```text
Please provide an element as an argument.
```

```bash
./element.sh 999
```

Output:

```text
I could not find that element in the database.
```

## Database design

The database is structured using a normalized schema:

- `elements`: stores atomic number, symbol, and name
- `properties`: stores atomic mass and temperature values
- `types`: stores element categories such as `nonmetal`, `metal`, and `metalloid`

This separation reduces duplication and keeps the data consistent and maintainable.

## How the script works

The `element.sh` script:

1. checks whether an argument was provided
2. determines whether the input is a numeric atomic number, symbol, or a name
3. runs a SQL query against the `periodic_table` database
4. prints the matching element information
5. returns a clear error when no match is found

## Validation

You can quickly validate the project with the following commands:

```bash
chmod +x element.sh
./element.sh 1
./element.sh H
./element.sh Oxygen
./element.sh 999
```

## Notes

This project is a practical example of combining relational database design with a lightweight Bash interface. It is useful for learning:

- PostgreSQL schema creation
- data normalization
- foreign key relationships
- SQL querying
- shell-based database interaction

## License

This project is released under the MIT license.

## Related

- freeCodeCamp Relational Database
- Periodic Table Database project
