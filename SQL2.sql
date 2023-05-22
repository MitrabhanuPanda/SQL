

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