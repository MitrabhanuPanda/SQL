

use demo_213;

# find out all the cancelled orders in 2004
select * from sales where status='cancelled' and year_id=2004;

# character length--> Counts characters present inside a string
select char_length('innomatics research lab');
SELECT 
    customername, CHAR_LENGTH(customername) AS len
FROM
    sales;

# Concat- Combining 
# 'ram', 'shyam','raghav'
select concat('ram', 'shyam','raghav') as com;

# Concat with separator
# Concat_ws(separator, string)
select concat_ws(' ','ram', 'shyam','raghav') as com;

select concat_ws(' ,',addressline1,addressline2,city,state,country,postalcode)as comined_address from sales;

# get the combined name of sales representative?


# Upper and Lower
select upper('innomatics');
select lower('INNOMATICS');

# LTrim and RTrim

# LTrim-->Remove Spaces from the left side of the string
# '     innomatics'
select char_length('     innomatics');
select ltrim('     innomatics');
select char_length(ltrim('     innomatics'));

# ltrim on customer name
select ltrim(customername) from sales;

# RTrim--> Remove Spaces from the right side of the string
select char_length('innomatics          ');
select rtrim('innomatics          ');
select char_length(rtrim('innomatics          '));

# left padding--> can be used in both number & string
# lpad(int,padding_string,string)
# innomatics
select lpad('innomatics',15,'0');

# try make customername of len 25 by adding spaces
select lpad(customername,25,' ') from sales;

# use rpad for the above query
select rpad(customername,25,' ') from sales;


# mid(string, start, length)--> get subset from a given string
select mid('innomatics',1,4);

# try to add initials to each country 3 characters
select mid(country,1,3) as initials from sales;

# Repeat
select repeat('x',5);
# Replace
select replace('SQL course','SQL','PYTHON');

# LEFT(string, no_of_char)
select left('hyderabad',3);

# Locate function: will help you to locate sub-string in string
# 'innomatics research labs'
select locate('labs','innomatics research labs');
select * from sales;
select orderdate, length(orderdate) from sales;


select orderdate from sales;
select orderdate ,mid(orderdate,1,locate(' ',orderdate)) as date from sales;
select orderdate,mid(orderdate,locate(' ',orderdate),16) as time from sales;
select orderdate, mid(orderdate,1,locate(' ',orderdate)) as date,mid(orderdate,locate(' ',orderdate),16) as time from sales;



