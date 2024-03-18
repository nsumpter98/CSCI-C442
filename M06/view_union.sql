use M06;

CREATE TABLE employees
(
    employee_id   INT PRIMARY KEY,
    first_name    VARCHAR(50),
    last_name     VARCHAR(50),
    department_id INT,
    job_id        INT
);

INSERT INTO employees (employee_id, first_name, last_name, department_id, job_id)
VALUES (1, 'John', 'Doe', 1, 101),
       (2, 'Jane', 'Smith', 2, 102),
       (3, 'Jim', 'Brown', 1, 103),
       (4, 'Jessica', 'Jones', 3, 104);

CREATE TABLE departments
(
    department_id   INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments (department_id, department_name)
VALUES (1, 'IT'),
       (2, 'Finance'),
       (3, 'Human Resources');


CREATE TABLE jobs
(
    job_id    INT PRIMARY KEY,
    job_title VARCHAR(50)
);

INSERT INTO jobs (job_id, job_title)
VALUES (101, 'Software Developer'),
       (102, 'Financial Analyst'),
       (103, 'IT Support Specialist'),
       (104, 'HR Manager');


CREATE TABLE employees_new
(
    employee_id INT PRIMARY KEY,
    first_name  VARCHAR(50),
    last_name   VARCHAR(50)
);

INSERT INTO employees_new (employee_id, first_name, last_name)
VALUES (1, 'Alice', 'Green'),
       (2, 'Bob', 'White');


CREATE TABLE employees_old
(
    employee_id INT PRIMARY KEY,
    first_name  VARCHAR(50),
    last_name   VARCHAR(50)
);

INSERT INTO employees_old (employee_id, first_name, last_name)
VALUES (1, 'Tom', 'Black'),
       (2, 'Alice', 'Green');



# Create a view named employee_summary that displays employees' first names, last names,
# and departments from two tables: employees and departments. Assume these tables are related by a column named department_id.
CREATE VIEW employee_summary as
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
         join departments d on e.department_id = d.department_id;


# Write a query to retrieve all records from the employee_summary view where the department name is "Finance".
SELECT *
FROM employee_summary
WHERE department_name = 'Finance';


# Write a query using the UNION operator to combine the first names and last names of all employees
# from two tables: employees_new and employees_old. Ensure there are no duplicate records in the result.
SELECT first_name, last_name
FROM employees_new
UNION
SELECT first_name, last_name
FROM employees_old;


