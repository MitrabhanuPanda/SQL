
use demo_213;
select * from sales;
select count(distinct(country)) from sales;

# Group By:
# avg sales for productline
select productline, avg(sales) from sales group by productline;
select productline,country, avg(sales) from sales group by productline,country;
select productline,country, avg(sales) from sales group by productline,country order by country;

# Just avg sales for each country
select country, avg(sales) from sales group by country order by country;

# sum
select sum(sales) as total_sales from sales;

# avg
select round(avg(sales),1)as avg_sales from sales;

# minimun
select min(sales) as minimun_sales from sales;

# Maximum
select max(sales) as maximum_sales from sales;

#Count
select count(ordernumber) as total_orders from sales;

# find out avg sales for each order status
select status, avg(sales) from sales group by status order by status;

select status, avg(sales) from sales group by status order by avg(sales) desc;

# find out total orders per status
select status,count(ordernumber) from sales group by status order by status;

# find out the total sales for each country per year
select country,year_id,sum(sales) as Total from sales group by country,year_id order by country,year_id;

# find out avg sales per year for every month
select year_id,month_id,round(avg(sales),1) as avg from sales group by year_id,month_id order by year_id,month_id;

# find maximum,minimumm, avg sales value for each dealisize
select dealsize, max(sales) as maxmimum, min(sales) as Minimum, avg(sales) as Average from sales group by dealsize order by dealsize;


# Having Clause
select productline, round(avg(sales),2) from sales group by productline having avg(sales)>3400;


# Find out the productline where total sales > 100000
select productline, round(sum(sales),1) from sales group by productline having sum(sales)>100000;

# find out the productlines and total sales where status is shipped
select productline,status,round(sum(sales),1) as total from sales group by status,productline having status='shipped';

select productline,round(sum(sales),1) as total from sales where status='shipped' group by productline;

# 
select customername,round(avg(quantityordered),1) as avgr from sales group by customername;




















