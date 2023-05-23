create database cs;
use cs;

# CASE STUDY-1:

create table brands
(brand_id int not null,
brand_name varchar(255) not null,

primary key(brand_id)
);

create table categories
(category_id int not null,
category_name varchar(255) not null,

primary key(category_id)
);


create table products
(product_id int not null auto_increment,
product_name varchar(256) not null,
brand_id int not null,
category_id int not null,
model_year smallint not null,
list_price decimal(10,2) not null,

primary key(product_id),

constraint bid
foreign key(brand_id) references brands(brand_id)
on update cascade
on delete cascade,

constraint cid
foreign key(category_id) references categories(category_id)
on update cascade
on delete cascade
);

create table stores
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

create table stocks
(store_id int not null auto_increment,
product_id int not null,
quantity int,

primary key(store_id,product_id),

constraint pid2
foreign key(product_id) references products(product_id)
on update cascade
on delete cascade,

constraint sid
foreign key(store_id) references stores(store_id)

);




create table staffs
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
foreign key(store_id) references stores(store_id)
on update cascade
on delete cascade,

constraint mitd
foreign key(manager_id) references staffs(staff_id)
on update cascade
on delete cascade

);

create table customers
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

create table orders
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
foreign key(customer_id) references customers(customer_id)
on update cascade
on delete cascade,

constraint sid2
foreign key(store_id) references stores(store_id)
on update cascade
on delete cascade,

constraint std
foreign key(staff_id) references staffs(staff_id)
on update cascade
on delete cascade

);


create table order_items
(order_id int not null,
item_id int not null,
product_id int not null,
quantity int not null,
list_price decimal(10,2) not null,
discount decimal(4,2) not null,

primary key(order_id,item_id),

constraint pid
foreign key(product_id) references products(product_id)
on update cascade
on delete cascade,

constraint oid
foreign key(order_id) references orders(order_id)
on update cascade
on delete cascade

);


