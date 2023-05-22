

use constraint_213;

# Cascade & Nut Null:

# category- cat_id primary key
create table category_1 (cat_id int primary key, c_name varchar(100));
insert into category_1 values
(1,'Phones'),
(2,'watch'),
(3,'Shoes');

# Product
create table product_fk_r1(id int primary key,p_name varchar(100),
cost int not null,cat_id int,
constraint cat_fk_k 
foreign key(cat_id) references category_1(cat_id)
on update cascade
on delete cascade);


insert into product_fk_r1 values
(1,'iphine12',30000,1),
(2,'Nokia',10000,1),
(3,'I_Watch',35000,2),
(4,'nike',20000,3);

select * from category_1;
select * from product_fk_r1;

update category_1 set cat_id=100 where cat_id=2;

# Set Nut Null:

# category
create table category_2 (cat_id int primary key, c_name varchar(100));
insert into category_2 values
(1,'Phones'),
(2,'watch'),
(3,'Shoes');

# Product
create table product_fk_r2(id int primary key,p_name varchar(100),
cost int not null,cat_id int,
constraint cat_fk_k2 
foreign key(cat_id) references category_2(cat_id)
on update set null
on delete set null);

insert into product_fk_r2 values
(1,'iphine12',30000,1),
(2,'Nokia',10000,1),
(3,'I_Watch',35000,2),
(4,'nike',20000,3);

select * from category_2;
select * from product_fk_r2;

update category_2 set cat_id=100 where cat_id=2;
delete from category_2 where cat_id=1;

create table products_c1
(id int unique,p_name varchar(100),cost int
constraint cat_fk_k3 
foreign key(id) references product_fk_r2(id));



