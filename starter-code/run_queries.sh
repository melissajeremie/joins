#!/bin/sh

# TODO: Write queries to display:

# Employees working at macys
SELECT first_name, last_name FROM employees INNER JOIN jobs ON employees.ssn = jobs.ssn WHERE company = 'Macy''s';

# Companies in Boston
SELECT company FROM jobs INNER JOIN employees ON employees.ssn = jobs.ssn WHERE city = 'Boston';

# Employee with the highest salary

SELECT first_name, last_name FROM employees INNER JOIN jobs ON employees.ssn = jobs.ssn ORDER BY salary DESC LIMIT 1;
