

#create table Person
CREATE TABLE Person (
    PersonID int NOT NULL,
    FirstName varchar(255),
    LastName varchar(255),
    type varchar(255),
    PRIMARY KEY (PersonID)
);

CREATE TABLE Instructor (
    PersonID int NOT NULL,
    Salary int,
    PRIMARY KEY (PersonID),
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);

CREATE TABLE Student (
    PersonID int NOT NULL,
    GraduationDate date,
    PRIMARY KEY (PersonID),
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);

CREATE TABLE Course (
    CourseID int NOT NULL,
    CourseName varchar(255),
    Topic varchar(255),
    PRIMARY KEY (CourseID)
);

CREATE TABLE Section (
    crs_id int NOT NULL,
    InstructorID int NOT NULL,
    cid int NOT NULL,
    days_of_week varchar(255),
    time_of_day time,
    location varchar(255),
    credit_hours int,
    status varchar(255),
    description varchar(255),
    capacity int,
    available_seats int,
    waitlist int,
    mode_of_instruction varchar(255),
    start_date date,
    end_date date,
    component varchar(255),
    requirement varchar(255),
    PRIMARY KEY (crs_id),
    FOREIGN KEY (InstructorID) REFERENCES Instructor(PersonID),
    FOREIGN KEY (cid) REFERENCES Course(CourseID)
);

CREATE TABLE Program (
    ProgramID int NOT NULL,
    ProgramName varchar(255),
    department varchar(255),
    PRIMARY KEY (ProgramID)
);

CREATE TABLE StudentProgram (
    PersonID int NOT NULL,
    ProgramID int NOT NULL,
    PRIMARY KEY (PersonID, ProgramID),
    FOREIGN KEY (PersonID) REFERENCES Student(PersonID),
    FOREIGN KEY (ProgramID) REFERENCES Program(ProgramID)
);

#section program
CREATE TABLE SectionProgram (
    crs_id int NOT NULL,
    ProgramID int NOT NULL,
    PRIMARY KEY (crs_id, ProgramID),
    FOREIGN KEY (crs_id) REFERENCES Section(crs_id),
    FOREIGN KEY (ProgramID) REFERENCES Program(ProgramID)
);

#Enrollment
CREATE TABLE Enrollment (
    PersonID int NOT NULL,
    crs_id int NOT NULL,
    enrollment_date date,
    PRIMARY KEY (PersonID, crs_id),
    FOREIGN KEY (PersonID) REFERENCES Student(PersonID),
    FOREIGN KEY (crs_id) REFERENCES Section(crs_id)
);


#insert into person
INSERT INTO Person (PersonID, FirstName, LastName, type) VALUES (1, 'John', 'Doe', 'Instructor');
INSERT INTO Person (PersonID, FirstName, LastName, type) VALUES (2, 'Jane', 'Doe', 'Instructor');
INSERT INTO Person (PersonID, FirstName, LastName, type) VALUES (3, 'Tom', 'Doe', 'Student');
INSERT INTO Person (PersonID, FirstName, LastName, type) VALUES (4, 'Jerry', 'Doe', 'Student');
INSERT INTO Person (PersonID, FirstName, LastName, type) VALUES (5, 'Alice', 'Doe', 'Student');
INSERT INTO Person (PersonID, FirstName, LastName, type) VALUES (6, 'Bob', 'Doe', 'Student');

#insert into instructor
INSERT INTO Instructor (PersonID, Salary) VALUES (1, 100000);
INSERT INTO Instructor (PersonID, Salary) VALUES (2, 120000);

#insert into student
INSERT INTO Student (PersonID, GraduationDate) VALUES (3, '2022-05-01');
INSERT INTO Student (PersonID, GraduationDate) VALUES (4, '2023-05-01');
INSERT INTO Student (PersonID, GraduationDate) VALUES (5, '2024-05-01');
INSERT INTO Student (PersonID, GraduationDate) VALUES (6, '2025-05-01');

#insert into course
INSERT INTO Course (CourseID, CourseName, Topic) VALUES (1, 'Math', 'Algebra');
INSERT INTO Course (CourseID, CourseName, Topic) VALUES (2, 'Science', 'Physics');
INSERT INTO Course (CourseID, CourseName, Topic) VALUES (3, 'English', 'Literature');

#insert into section
INSERT INTO Section (crs_id, InstructorID, cid, days_of_week, time_of_day, location, credit_hours, status, description, capacity, available_seats, waitlist, mode_of_instruction, start_date, end_date, component, requirement) VALUES (1, 1, 1, 'MWF', '10:00:00', 'Online', 3, 'Open', 'Algebra', 100, 100, 0, 'Online', '2021-08-01', '2021-12-01', 'Lecture', 'None');
INSERT INTO Section (crs_id, InstructorID, cid, days_of_week, time_of_day, location, credit_hours, status, description, capacity, available_seats, waitlist, mode_of_instruction, start_date, end_date, component, requirement) VALUES (2, 2, 2, 'MWF', '11:00:00', 'Online', 3, 'Open', 'Physics', 100, 100, 0, 'Online', '2021-08-01', '2021-12-01', 'Lecture', 'None');
INSERT INTO Section (crs_id, InstructorID, cid, days_of_week, time_of_day, location, credit_hours, status, description, capacity, available_seats, waitlist, mode_of_instruction, start_date, end_date, component, requirement) VALUES (3, 1, 3, 'MWF', '12:00:00', 'Online', 3, 'Open', 'Literature', 100, 100, 0, 'Online', '2021-08-01', '2021-12-01', 'Lecture', 'None');

#insert into program
INSERT INTO Program (ProgramID, ProgramName, department) VALUES (1, 'Math', 'Science');
INSERT INTO Program (ProgramID, ProgramName, department) VALUES (2, 'Physics', 'Science');
INSERT INTO Program (ProgramID, ProgramName, department) VALUES (3, 'English', 'Arts');

#insert into student program
INSERT INTO StudentProgram (PersonID, ProgramID) VALUES (3, 1);
INSERT INTO StudentProgram (PersonID, ProgramID) VALUES (4, 2);
INSERT INTO StudentProgram (PersonID, ProgramID) VALUES (5, 3);
INSERT INTO StudentProgram (PersonID, ProgramID) VALUES (6, 1);

#insert into section program
INSERT INTO SectionProgram (crs_id, ProgramID) VALUES (1, 1);
INSERT INTO SectionProgram (crs_id, ProgramID) VALUES (2, 2);
INSERT INTO SectionProgram (crs_id, ProgramID) VALUES (3, 3);

#insert into enrollment
INSERT INTO Enrollment (PersonID, crs_id, enrollment_date) VALUES (3, 1, '2021-08-01');
INSERT INTO Enrollment (PersonID, crs_id, enrollment_date) VALUES (4, 2, '2021-08-01');
INSERT INTO Enrollment (PersonID, crs_id, enrollment_date) VALUES (5, 3, '2021-08-01');
INSERT INTO Enrollment (PersonID, crs_id, enrollment_date) VALUES (6, 1, '2021-08-01');


#run some reports
#1. List all students enrolled in a specific course and name the columns as StudentID, FirstName, LastName, CourseID, CourseName, Topic, and InstructorName.
SELECT s.PersonID AS StudentID, p.FirstName, p.LastName, c.CourseID, c.CourseName, c.Topic, p2.FirstName AS InstructorName
FROM Student s
JOIN Enrollment e ON s.PersonID = e.PersonID
JOIN Section sec ON e.crs_id = sec.crs_id
JOIN Course c ON sec.cid = c.CourseID
JOIN Instructor i ON sec.InstructorID = i.PersonID
JOIN Person p ON s.PersonID = p.PersonID
JOIN Person p2 ON i.PersonID = p2.PersonID
WHERE c.CourseID = 1;

