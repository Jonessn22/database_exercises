#LIMIT EXERCISES

/* 1. Create a new SQL script named limit_exercises.sql. */

/* 2. List the first 10 distinct last name sorted in descending order. */
SELECT DISTINCT last_name
FROM employees
LIMIT 10;

/* Facello
Simmel
Bamford
Koblick
Maliniak
Preusig
Zielinski
Kalloufi
Peac
Piveteau */