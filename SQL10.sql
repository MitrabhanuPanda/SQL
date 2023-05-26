# Dt-25/05/23

# Windows Functions:

# Partition By:
select productline,sales, dense_rank() over(partition by productline order by sales desc) as rnk from demo_213.sales;


# In Tmeperary column we donot use Rank.

# Rank--> Common Table Expression--> q1(q2(q3)),, Write multiple query and connect them each other
#		  View-->Take the output and create a new table.
#				 When some update is done in Parent table the the New table automatically Update.
#         Store Procedure--> 


# QUES:

# Get n highest sales

# 1.CTE

with query1 as(select *, dense_rank() over(order by sales desc)as rnk from demo_213.sales)
select * from query1 where rnk<=5;

# Get the records top 5 from each country based on sales
with query2 as(select *, dense_rank() over(partition by country order by sales desc)as rnk from demo_213.sales)
select * from query2 where rnk<=5;

# find top 10 sales from usa
with query3 as (select *, dense_rank() over(partition by country order by sales desc)as rnk from demo_213.sales)
select * from query3 where country='usa' and rnk<=10;

# 2.VIEWS:

use demo_213;

create view ranked_sales as
with query3 as (select *, dense_rank() over(partition by country order by sales desc)as rnk from demo_213.sales)
select * from query3 where country='usa' and rnk<=10;
select * from ranked_sales where rnk<=10 and country='usa';

# Find records where sales >avg(sales)
create view avg_sales as
select * from demo_213.sales
where sales> (select avg(sales) from demo_213.sales);

select * from avg_sales;



# 3. Store Procedure:

# 				delimiter $
# 				Create procedure name_of_procedure(in variable_name datatype)
# 				begin
#					select * from sales;
# 				end $
# 				delimiter ;
              
#				call name_of_procedure(name of recors inside the variable) ;     



# sale from different countries
use demo_213;

delimiter $
create procedure country_sales(in x varchar(50) )
begin
	select * from sales where country=x;
end $
delimiter ;

call country_sales('usa');

call country_sales('austria');

# write a stored procedure to get top 5 sales from given country

delimiter $
create procedure country_rank3(in x varchar(50) )
begin
	
    with query4 as(select *, dense_rank() over(partition by country order by sales desc)as rnk from demo_213.sales)
	select * from query4 where rnk<=5 and country=x;
end $
delimiter ;

call country_rank3('usa');
