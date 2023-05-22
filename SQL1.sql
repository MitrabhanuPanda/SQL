create database demo_213;  # Create a database
use demo_213;              # use the database


# create employee table has empID, firstname, lastname,age
create table employee(
			empId smallint,
            first_name varchar(25),
            last_name varchar(25),
            age smallint);
            
 # create financial_info table has empid, bank name,acc number  
 create table financial_info(
					empid smallint,
                    bank_name varchar(50),
                    acc_number bigint);
                    
 # create emp_personal table has emp name, address,phone number
 create table emp_personal(
				emp_name varchar(40),
                address text,
                phone_number char(10));



# inserting records inside a table

#employee
insert into employee values( 1,'ram','biden',25);
insert into employee values(2,'raj','widen',27);
insert into employee values(3,'rahul','siden',28);
insert into employee values(4,'raghu','aiden',26);


insert into employee (empId,first_name,last_name,age)
values(1,'joe',65);

insert into employee (empId,first_name,age)
values(1,'joe',65);

insert into employee (age,first_name,last_name,empId)
values(51,'ross','geller',7);


# Alter Add
# How to add new columns

# add email column in employee table
alter table employee add column email varchar(100);

# add mobile_number column in emp_personal table
alter table emp_personal add column mobile_number char(10);
			
# Alter  Drop
# How to delete columns
alter table employee drop email;

# Alter Rename
# How to rename a column
alter table employee rename column empId to employee_ID;

# Alter Modify
# How to change columns datatype
alter table employee modify column age tinyint;


# Drop
# Dropping a table
drop table financial_info;

# Dropping a database
drop database bhanu;



# Dt-15/05/23
use demo_213;

# Update Commands
select * from employee;

# set the safe sql update by 0 it mean disable by 1 enable
set sql_safe_updates=0;
update  employee set age=25 where employee_ID=3;

# Deleting a row
delete from employee where employee_ID=3;


# Truncate a table
truncate table employee;



# DQL COMMANDS in MYSQL
select * from sales;

# data where deal size is large
select * from sales where DEALSIZE="Large";

# How many dealsize we have
select distinct(dealsize) from sales;

# no of productline
select distinct(productline) from sales;

# find the records where productline is trains
select * from sales where productline="trains";

# ordernumber, sales, productline
select ordernumber,sales,productline from sales;

# Logical Operators---> AND, OR, NOT

# AND
# record where sales<10000 and greater than 5000
select * from sales where sales<10000 and sales>5000;

#find the records where sales is greater than 5000 and country is france
select * from sales where sales>5000 and country='france';


# BETWEEN will range
select * from sales where sales between 8000 and 10000;


#OR
select * from sales where country='usa' or dealsize='large';

# find out all the records where is either usa or france or uk or austria
select * from sales where country='usa' or country='france' or country='uk' or country='austria';

# IN Operator
select * from sales where country in ('usa','france','uk','austria');

# find records where sales is greater than or equal to 12000
select * from sales where sales>=12000;

#find the records where dealsize is large, country is usa, and sale is greater than 120000
select * from sales where dealsize = 'large' and country='usa' and sales>=12000;

#find all the product code where productline is either trains or motorcycles and sales<3000
select productcode from sales where productline='trains' or productline='motorcycles' and sales<3000;



#Arithimatic Operations
select * from sales;

# Round function and arithimatic operation 
select  round(quantityordered * priceeach,2) as sales_amount from sales;

# find out the new sales amount if you have to give 10% discount
select round(sales- sales*0.10,2) as sales_dis,sales from sales;
select round(sales*0.9,2) as sales_dis,sales from sales;

# try to update dealsize to big where dealsize is large
select * from sales;
set sql_safe_updates=0;
update  sales set dealsize='big' where dealsize='large';

# delete records where sales less 1000
delete from sales where sales<1000;