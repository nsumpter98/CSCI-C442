CREATE TABLE employees
(
    employee_id INT NOT NULL,
    first_name  VARCHAR(50),
    last_name   VARCHAR(50),
    department  VARCHAR(50),
    salary      DECIMAL(10, 2),
    PRIMARY KEY (employee_id)
);

INSERT INTO employees (employee_id, first_name, last_name, department, salary)
VALUES (1, 'John', 'Doe', 'IT', 60000.00),
       (2, 'Jane', 'Smith', 'HR', 55000.00),
       (3, 'Michael', 'Johnson', 'Marketing', 58000.00),
       (4, 'Emily', 'Brown', 'Finance', 62000.00),
       (5, 'David', 'Wilson', 'IT', 63000.00),
       (6, 'Sarah', 'Jones', 'HR', 56000.00),
       (7, 'Daniel', 'Taylor', 'Marketing', 59000.00),
       (8, 'Hannah', 'Anderson', 'Finance', 64000.00),
       (9, 'Matthew', 'Martinez', 'IT', 61000.00),
       (10, 'Olivia', 'Thomas', 'HR', 57000.00),
       (11, 'Christopher', 'Hernandez', 'Marketing', 60000.00),
       (12, 'Ava', 'Moore', 'Finance', 63000.00),
       (13, 'Andrew', 'Clark', 'IT', 62000.00),
       (14, 'Isabella', 'Lewis', 'HR', 58000.00),
       (15, 'William', 'Walker', 'Marketing', 61000.00),
       (16, 'Sophia', 'Hall', 'Finance', 65000.00),
       (17, 'James', 'Young', 'IT', 64000.00),
       (18, 'Charlotte', 'Allen', 'HR', 59000.00),
       (19, 'Benjamin', 'King', 'Marketing', 62000.00),
       (20, 'Amelia', 'Scott', 'Finance', 66000.00);


# Tasks:
#
# Retrieve the details of all employees from the employees table sorted by their last name in ascending order.
SELECT * FROM employees ORDER BY last_name;

# Retrieve the first name, last name, and salary of employees in the "Finance" department.
SELECT first_name, last_name, salary FROM employees WHERE department = 'Finance';

# Retrieve the highest salary among all employees.
SELECT department, MAX(salary) FROM employees GROUP BY department;

# Retrieve the average salary of employees in the "HR" department.
SELECT AVG(salary) as avg_salary FROM employees WHERE department = 'HR';

# Retrieve the total number of employees in each department.
SELECT department, COUNT(*) FROM employees GROUP BY department;

# Retrieve departments with more than 3 employee.
SELECT department, COUNT(*) FROM employees GROUP BY department HAVING COUNT(*) > 3;