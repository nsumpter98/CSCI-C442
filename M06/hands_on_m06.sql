use M06;

-- Create tables
CREATE TABLE students
(
    student_id INT PRIMARY KEY,
    name       VARCHAR(50),
    age        INT,
    gender     VARCHAR(10)
);

CREATE TABLE courses
(
    course_id   INT PRIMARY KEY,
    course_name VARCHAR(50),
    instructor  VARCHAR(50)
);

CREATE TABLE student_courses
(
    enrollment_id INT PRIMARY KEY,
    student_id    INT,
    course_id     INT,
    FOREIGN KEY (student_id) REFERENCES students (student_id),
    FOREIGN KEY (course_id) REFERENCES courses (course_id)
);

-- Insert sample data
INSERT INTO students (student_id, name, age, gender)
VALUES (1, 'John Doe', 20, 'Male'),
       (2, 'Jane Smith', 22, 'Female'),
       (3, 'Michael Johnson', 21, 'Male');

INSERT INTO courses (course_id, course_name, instructor)
VALUES (1, 'Mathematics', 'Dr. Smith'),
       (2, 'Computer Science', 'Prof. Johnson'),
       (3, 'History', 'Dr. Adams');

INSERT INTO student_courses (enrollment_id, student_id, course_id)
VALUES (1, 1, 1),
       (2, 2, 2),
       (3, 2, 2),
       (4, 3, 3);

-- a. Retrieve the names of all students enrolled in the course "Computer Science".
select s.name
from students s
         inner join student_courses sc on s.student_id = sc.student_id
         inner join courses c on sc.course_id = c.course_id
where c.course_name = 'Computer Science';

-- b. List all courses along with the names of students enrolled in each course.
select c.course_name, s.name
from courses c
         inner join student_courses sc on c.course_id = sc.course_id
         inner join students s on sc.student_id = s.student_id;

-- c. Display the count of students enrolled in each course.
select c.course_name, count(sc.student_id) as student_count
from courses c
         left join student_courses sc on c.course_id = sc.course_id
group by c.course_name;

-- d. Find the average age of students enrolled in each course.
select c.course_name, avg(s.age) as average_age
from courses c
         inner join student_courses sc on c.course_id = sc.course_id
         inner join students s on sc.student_id = s.student_id
group by c.course_name;

-- e. List all students who are not enrolled in any course.
select s.name
from students s
         left join student_courses sc on s.student_id = sc.student_id
where sc.student_id is null;