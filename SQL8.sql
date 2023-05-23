# Dt-23/05/23

# Join: Combining one or more tables--> Condition

#Types: Inner,Left,Right,Cross,Outer, Self Join

# 1-Column
# 2-Table
# 3-Type of Join
# 4-On

create database joinn;
use joinn;


create table category(cid int primary key,cat_name varchar(150));
insert into category values(1,'phone'),(2,'watch'),(3,'shoes'),(4,'wearables');

create table products(p_id int primary key,p_name varchar(150),cost int,category_id int,constraint cat_id_fk foreign key(category_id) references category(cid) on update cascade on delete set null);
insert into products values(1,'iphone',23000,1),(2,'i-13',52000,1),(3,'samsung',30000,1),(4,'s-watch',12000,2),(5,'nike',40000,3),(6,'reebok',3000,3);
insert into products(p_id,p_name,cost) values (7,'ring',15000),(8,'toe-ring',2000);

select * from category;
select * from products;

drop table products;

# INNER JOIN:

select p.p_id,p.p_name,c.cat_name,p.cost,c.cid from category as c
inner join products as p
on c.cid=p.category_id;

# LEFT JOIN:

select p.p_id,p.p_name,c.cat_name,p.cost,c.cid from products as p
left join category as c
on c.cid=p.category_id;

# RIGHT JOIN:

select p.p_id,p.p_name,c.cat_name,p.cost,c.cid from category as c
right join products as p
on c.cid=p.category_id;


select p.p_id,p.p_name,c.cat_name,p.cost,c.cid from products as p
right join category as c
on c.cid=p.category_id;

# CROSS JOIN:

select  p.p_name,c.Cat_name from products as p cross join category as c;

# Auto-Increament:

create table patients
(patientID int auto_increment,
Fname varchar(50),
age int,

primary key(patientID)
);

insert into patients values(1,'Joy',25);
select * from patients;

insert into patients(Fname,age) values('jane',26),('frank',28),('john',22),('David',26),('Amelia',21),
('peter',20),('saksham',26),('ross',32);

# To create a constraint
alter table patients add constraint primary key(age);
 
alter table production.categories add constraint auto_increment primary key(category_id);
