use sp24;



# create table students(
#     id int,
#     name varchar(30),
#     address varchar(100),
#     dateOfBirth date,
#     primary key (id)
# );





describe students;


select address, count(address) as num from students group by address;