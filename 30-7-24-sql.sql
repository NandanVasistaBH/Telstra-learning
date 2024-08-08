show databases;

create database if not exists sample_db;
create schema  if not exists sample_db; -- 1 row(s) affected, 1 warning(s): 1007 Can't create database 'sample_db'; database exists

-- in MySQL, physically, a schema is synonymous with a database

drop schema if exists sample_db;

create database if not exists retail_db;
use retail_db;
create table if not exists Products(
	prod_id int not null,
    prod_name varchar(45) not null,
    quantity_in_hand int not null,
    re_order_qty int null,
    re_order_level int null,
    price int null
    );
describe Products;
    
create table if not exists customers(
	cus_id int not null,
    fname varchar(55) not null,
    lname varchar(55) not null,
    addr varchar(100) not null,
    city varchar(60),
    postalcode int
    );

desc customers; -- same as describe table_name

alter table customers add gender varchar(10);
alter table customers change column gender sex varchar(10);
alter table customers change column cus_id cus_id int primary key not null;-- will this cause data loss ?
-- alter table customers add primary key(cus_id); this is better
alter table customers drop column sex;

desc customers;


drop table Products;

create table if not exists Products(
	prod_id int not null primary key,
    prod_name varchar(45) not null,
    quantity_in_hand int not null,
    re_order_qty int null,
    re_order_level int null,
    price int null
    );
    drop table if exists orders;
CREATE TABLE Orders (
    ord_id INT NOT NULL,
      prod_id INT,
    cus_id INT ,
    ord_name VARCHAR(55),
    ord_price DOUBLE,
      Foreign key(prod_id) REFERENCES Products(prod_id) ON DELETE CASCADE,
      Foreign key(cus_id)  REFERENCES customers(cus_id) ON DELETE CASCADE
);

desc Orders;
alter table Orders add primary key(ord_id,prod_id,cus_id);
desc orders;

desc products;
insert into products values(1,"nirma washing powder",0,0,0,100);
select * from products;

desc customers;
insert into customers values(1,"nandan","vasista","uttarahalli","BLR",560061);
desc Orders;
insert into orders values(1,1,1,"washing orders",200);


delete from Products where prod_id=1;

select * from Products;
select * from orders;

delete from customers where cus_id=1;



insert into products values(2,"Vim Liquid",0,0,0,101);
insert into customers values(3,"SHIVA","AG","VijayaNagar","BLR",560018);
insert into orders values(1,1,1,"washing orders",200);




select * from orders;
insert into Orders values(4,2,3,"blah",200);
insert into Orders values(5,2,3,"blah",200);
insert into Orders values(6,2,3,"blah",202);
insert into Orders values(7,2,3,"blah",203);
insert into Orders values(8,2,3,"blah",202);
select * from customers;
delete from customers where cus_id=3;
delete from products where prod_id=2;
drop table orders;

update orders set ord_price=20001; -- changes all the rows if operating in Not safe mode but if you're using safe mood then it will throw an error

-- when you use truncate u can't roll back and can't use any where conditions 

update orders set ord_price=2001 where ord_id=7;

select * from orders;


drop table orders;
drop table products;
drop table customers;

select * from customers;
insert into customers values(4,"SHIV","K","VijayaNagar","MYS",560018);
insert into customers values(5,"abc","K","def","hub",560018);
