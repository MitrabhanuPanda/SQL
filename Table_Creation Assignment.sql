create database production;
use production;

create table production.brands
(brand_id int not null,
brand_name varchar(255) not null,

primary key(brand_id)
);

create table production.categories
(category_id int not null,
category_name varchar(255) not null,

primary key(category_id)
);

create table production.products
(product_id int not null auto_increment,
product_name varchar(256) not null,
brand_id int not null,
category_id int not null,
model_year smallint not null,
list_price decimal(10,2) not null,

primary key(product_id),

constraint bid
foreign key(brand_id) references production.brands(brand_id)
on update cascade
on delete cascade,

constraint cid
foreign key(category_id) references production.categories(category_id)
on update cascade
on delete cascade
);

create table production.stocks
(store_id int not null auto_increment,
product_id int not null,
quantity int,

primary key(store_id,product_id),

constraint pid2
foreign key(product_id) references production.products(product_id)
on update cascade
on delete cascade,

constraint sid
foreign key(store_id) references sales.stores(store_id)

);

create database sales;
use sales;



create table sales.customers
(customer_id int not null auto_increment,
first_name varchar(255) not null,
last_name varchar(255) not null,
phone varchar(25),
email varchar(255) not null,
street varchar(255),
city varchar(50),
state varchar(25),
zip_code varchar(5),

primary key(customer_id)

);


create table sales.stores
(store_id int not null auto_increment,
store_name varchar(255) not null,
phone varchar(25),
email varchar(255),
street varchar(255),
city varchar(255),
state varchar(10),
zip_code varchar(5),

primary key(store_id)

);


create table sales.staffs
(staff_id int not null auto_increment,
first_name varchar(50) not null,
last_name varchar(50) not null,
email varchar(255) not null unique,
phone varchar(25),
active tinyint not null,
store_id int,
manager_id int,

primary key(staff_id),

constraint stdd
foreign key(store_id) references sales.stores(store_id)
on update cascade
on delete cascade,

constraint mitd
foreign key(manager_id) references sales.staffs(staff_id)
on update cascade
on delete cascade

);

create table sales.orders
(order_id int not null auto_increment,
customer_id int,
order_status tinyint not null,
order_date date not null,
required_date date not null,
shipped_date date,
store_id int not null,
staff_id int not null,

primary key(order_id),

constraint cid2
foreign key(customer_id) references sales.customers(customer_id)
on update cascade
on delete cascade,

constraint sid2
foreign key(store_id) references sales.stores(store_id)
on update cascade
on delete cascade,

constraint std
foreign key(staff_id) references sales.staffs(staff_id)
on update cascade
on delete cascade

);

create table sales.order_items
(order_id int not null,
item_id int not null,
product_id int not null,
quantity int not null,
list_price decimal(10,2) not null,
discount decimal(4,2) not null,

primary key(order_id,item_id),

constraint pid
foreign key(product_id) references production.products(product_id)
on update cascade
on delete cascade,

constraint oid
foreign key(order_id) references sales.orders(order_id)
on update cascade
on delete cascade

);


select * from  production.brands;
select * from production.stocks;
select * from sales.staffs;

select * from sales.stores;

select * from sales.orders;
select * from production.products;
select * from production.categories;
select * from sales.order_items;

select * from sales.customers;




SET sql_mode = 'PAD_CHAR_TO_FULL_LENGTH';
select c.customer_id,concat_ws(' ',c.first_name,c.last_name)as customer_name,s.customer_id as order_id,s.order_date,d.list_price,q.quantity as Unit_sold,sum(round(q.quantity*(q.list_price *(100-(q.discount*100))/100),2)) as Reveneu,d.product_name,o.category_name,f.store_name,concat_ws(' ',w.first_name,w.last_name)as staff from sales.orders as s
inner join sales.customers as c
on c.customer_id=s.order_id 
inner join production.products as d
on s.order_id=d.product_id
inner join production.categories as o
on d.category_id=o.category_id
inner join sales.stores as f
on s.store_id = f.store_id
inner join sales.staffs as w
on s.store_id=w.staff_id
inner join sales.order_items as q
on s.order_id=q.order_id
group by s.order_id,concat_ws(' ',c.first_name,c.last_name)
order by s.order_id;




