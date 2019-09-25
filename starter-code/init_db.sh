#!/bin/sh

# TODO: Create database and initialize database table structure

psql postgres -c 'CREATE DATABASE joinhw;'

psql -d joinhw -c 'BEGIN;
CREATE TABLE employees (
    id SERIAL PRIMARY KEY NOT NULL,
    ssn VARCHAR(255) NOT NULL UNIQUE,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    year_of_birth INT NOT NULL,
    city VARCHAR(255) NOT NULL
);
COMMIT;'
psql -d joinhw -c 'BEGIN;
CREATE TABLE jobs (
    id SERIAL PRIMARY KEY NOT NULL,
    ssn VARCHAR(255) NOT NULL,
    company VARCHAR(255) NOT NULL,
    salary INT NOT NULL,
    experience INT NOT NULL,
    FOREIGN KEY (ssn) REFERENCES employees(ssn)
);
COMMIT;'

# TODO: Insert data into tables

psql -d joinhw -c "COPY employees(ssn,first_name,last_name,year_of_birth,city) FROM '/Users/mkj/Desktop/MYAMEX/Homework/week05/03-Wednesday/joins/starter-code/employees.csv' DELIMITER ',' CSV HEADER";
psql -d joinhw -c "COPY jobs(ssn,company,salary,experience) FROM '/Users/mkj/Desktop/MYAMEX/Homework/week05/03-Wednesday/joins/starter-code/jobs.csv' DELIMITER ',' CSV HEADER";
