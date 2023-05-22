
use demo_213;


# DDL:

create table student(
		id smallint,
        name varchar(100),
        class smallint,
        sec varchar(5)
        );
insert into student values
(1,'raj',8,'A'),
(2,'ram',9,'B'),
(3,'raka',10,'C');

insert into student values
(4,'ajay',5,'D'),
(5,'arun',7,'C');

select * from student;

set sql_safe_updates=0;
update student set sec='D' where id=2;

update student set class=10 where id=4;

delete from student where id=4;

delete from student where id=2;

truncate table student;

drop table student;


# DQL:
select * from sales where country='usa' and dealsize='big' and sales >5000;

select * from sales;

select ordernumber from sales where status='cancelled' and year_id=2004;

select customername,sales from sales;

select * from sales where sales>8000;

select customername from sales where sales>8000;

select  concat_ws(' ',contactfirstname,contactlastname) as fullname,sales  from sales;



