use M06;


# create table
CREATE TABLE department_log
(
    department_id   INT,
    department_name VARCHAR(100),
    modified_date   DATETIME
);

# create trigger
CREATE TRIGGER DepartmentLogger
    AFTER INSERT
    ON departments
    FOR EACH ROW
BEGIN
    INSERT INTO department_log (department_id, department_name, modified_date)
    VALUES (NEW.department_id, NEW.department_name, NOW());
END;

# insert data
INSERT INTO departments (department_id, department_name)
VALUES (12, 'HR');

INSERT INTO departments (department_id, department_name)
VALUES (13, 'Finance');

SHOW TRIGGERS;