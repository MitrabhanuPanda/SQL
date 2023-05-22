

# Constraints:
# data inserting is correct form
# Constraint--> Unique
#			--> Default
#			--> Not Null
#			---> Check
#           --> Auto Increment
#           -->Key--> Primary Key
#				 ---> Forein Key
#                 ---> Candidate Key
#                 ---> Super Key

create database constraint_213;
use constraint_213;

# Unique:
create table employee_uni(id int unique,name varchar(100),salary int);
insert into employee_uni values
(1,'A',2000),
(2,'B',3000),
(3,'C',4000);
insert into employee_uni values
(1,'D',5000);
select * from employee_uni;

# Not Null:
create table employee_nn(id int unique,name varchar(100),salary int not null);
describe employee_nn;
insert into employee_nn values
(1,'S',6777),
(2,'D',4444),
(3,'E',6777);
insert into employee_nn values(4,'S');
select * from employee_nn;

# Default--> Pre-Defined:
create table products(id int unique,p_name varchar(100),cost int default(500));
insert into products values
(1,'SS',400),
(2,'DD',600),
(3,'EE',200);
insert into products(id,p_name) values(4,'AA');
select * from products;

# Check:--> If the condition is getting satisfied.
create table products_c(id int unique,p_name varchar(100),cost int check(cost>5000));
describe products_c;
insert into products_c values
(1,'SS',6000),
(2,'DD',6500),
(3,'EE',5500);
insert into products_c values(4,'AA',4999);
select * from products_c;

# Key:
# Primary Key:--> colmn is (Unique + Not Null),
# Colmn PK--> Uniquely identify by each records.

# Foreign Key:-->Create a relationship between two tables.
# May have repeated value, Null values
# Foreign Key--> Restrict --> Update & Delete
#				Cascade
#                


# Foreign Key with Restrict:

# category- cat_id primary key
create table category (cat_id int primary key, c_name varchar(100));
insert into category values
(1,'Phones'),
(2,'watch'),
(3,'Shoes');

#Product
create table product_fk_r(id int primary key,p_name varchar(100),
cost int not null,cat_id int,
constraint cat_fk 
foreign key(cat_id) references category(cat_id))

constraint pro_fk_
foreign key(cat_id) references category(cat_id))

describe product_fk_r;
select * from product_fk_r;

insert into product_fk_r values
(1,'iphine12',30000,1),
(2,'Nokia',10000,1),
(3,'I_Watch',35000,2),
(4,'nike',20000,3);


select * from product_fk_r;

update category set cat_id=100 where cat_id=2;
delete from category where cat_id=2;







