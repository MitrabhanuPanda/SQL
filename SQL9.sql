# Dt-24/05/23

# Window Functions:

# Row Number

select *, row_number() over(order by sales desc) as rowNum from demo_213.sales;

# Rank
select quantityordered , rank() over(order by quantityordered desc) as Rankqun from demo_213.sales;

# Dense Rank
select quantityordered , dense_rank() over(order by quantityordered desc) as DRankqun from demo_213.sales;

select sales , dense_rank() over(order by sales desc) as Rankqun from demo_213.sales;