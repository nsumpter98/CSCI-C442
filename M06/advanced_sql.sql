use M06;

create table TUTOR
(
    TutorID  int primary key,
    CertDate date,
    Status   varchar(20)
);


create table STUDENT
(
    StudentID int primary key,
    GroupNo   int,
    ReadN     varchar(20)
);

create table MATCH_HISTORY
(
    MatchID   int primary key,
    TutorID   int,
    StudentID int,
    StartDate date,
    EndDate   date,
    foreign key (TutorID) references TUTOR (TutorID),
    foreign key (StudentID) references STUDENT (StudentID)
);


create table TUTOR_REPORT
(
    MatchID int,
    Month   varchar(20),
    Hours   int,
    Lessons int,
    primary key (MatchID, Month),
    foreign key (MatchID) references MATCH_HISTORY (MatchID)
);

insert into TUTOR
values (1, '2019-01-01', 'Active');
insert into TUTOR
values (2, '2019-01-01', 'Active');
insert into TUTOR
values (3, '2019-01-01', 'Active');
insert into TUTOR
values (4, '2019-01-01', 'Active');
insert into TUTOR
values (5, '2019-01-01', 'Active');
insert into TUTOR
values (6, '2019-01-01', 'Active');
insert into TUTOR
values (7, '2019-01-01', 'Active');
insert into TUTOR
values (8, '2019-01-01', 'Active');
insert into TUTOR
values (9, '2019-01-01', 'Active');
insert into TUTOR
values (10, '2019-01-01', 'Inactive');
insert into TUTOR
values (106, '2019-01-01', 'Dropped');

insert into STUDENT
values (1, 1, 3.5);
insert into STUDENT
values (2, 1, 3.5);
insert into STUDENT
values (3, 3, 3.5);
insert into STUDENT
values (4, 1, 3.5);
insert into STUDENT
values (5, 1, 3.5);
insert into STUDENT
values (6, 2, 3.5);
insert into STUDENT
values (7, 1, 3.5);
insert into STUDENT
values (8, 1, 3.5);
insert into STUDENT
values (9, 3, 3.5);
insert into STUDENT
values (10, 1, 3.5);

insert into MATCH_HISTORY
values (1, 1, 1, '2019-01-01', '2019-01-31');
insert into MATCH_HISTORY
values (2, 2, 2, '2019-01-01', '2019-01-31');
insert into MATCH_HISTORY
values (3, 3, 3, '2019-01-01', '2019-01-31');
insert into MATCH_HISTORY
values (4, 4, 4, '2019-01-01', '2019-01-31');
insert into MATCH_HISTORY
values (5, 5, 5, '2019-01-01', '2019-01-31');
insert into MATCH_HISTORY
values (6, 6, 6, '2019-01-01', '2019-01-31');
insert into MATCH_HISTORY
values (7, 7, 7, '2019-01-01', '2019-01-31');
insert into MATCH_HISTORY
values (8, 8, 8, '2018-01-01', '2018-01-31');
insert into MATCH_HISTORY
values (10, 6, 9, '2018-07-01', '2018-07-31');

insert into MATCH_HISTORY
values (11, 106, 10, '2019-01-01', '2019-01-31');

insert into TUTOR_REPORT
values (1, 'January', 10, 5);
insert into TUTOR_REPORT
values (2, 'January', 10, 5);
insert into TUTOR_REPORT
values (3, 'January', 10, 5);
insert into TUTOR_REPORT
values (4, 'January', 10, 5);
insert into TUTOR_REPORT
values (5, 'January', 10, 5);
insert into TUTOR_REPORT
values (6, 'January', 10, 5);
insert into TUTOR_REPORT
values (10, 'July', 10, 5);

# 1. Write a SQL query to identify all students who have been matched in 2018 with a tutor whose status is Active.
select s.StudentID, s.GroupNo, s.ReadN
from STUDENT s
         join MATCH_HISTORY m on s.StudentID = m.StudentID
         join TUTOR t on m.TutorID = t.TutorID
where t.Status = 'Active'
  and m.StartDate >= '2018-01-01'
  and m.StartDate <= '2018-12-31';


# 2. Write an SQL query to determine the total number of hours and the total number of lessons Tutor 106 taught in July 2018.
select sum(Hours), sum(Lessons)
from TUTOR_REPORT
         join MATCH_HISTORY m on TUTOR_REPORT.MatchID = m.MatchID
where m.StartDate >= '2018-07-01'
  and m.StartDate <= '2018-07-31'
  and m.TutorID = 106;

# 3. Write an SQL query to list the Read scores of students who were ever taught by tutors whose status is Dropped.
select s.ReadN
from STUDENT s
         join MATCH_HISTORY m on s.StudentID = m.StudentID
         join TUTOR t on m.TutorID = t.TutorID
where t.Status = 'Dropped';

# 4. For each student group, list the number of tutors who have been matched with that group.
select s.GroupNo, count(distinct m.TutorID)
from STUDENT s
         join MATCH_HISTORY m on s.StudentID = m.StudentID
group by s.GroupNo;

# 5. List the total number of lessons taught in 2018 by tutors in each of the three Status categories. (Hint: DatePart(“yyyy”,MatchHistory.StartDate) = 2018)
select t.Status, sum(Lessons)
from TUTOR t
         join MATCH_HISTORY m on t.TutorID = m.TutorID
         join TUTOR_REPORT tr on m.MatchID = tr.MatchID
where m.StartDate >= '2018-01-01'
  and m.StartDate <= '2018-12-31'
group by t.Status;




