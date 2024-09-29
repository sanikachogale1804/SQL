create database dennys_dinner;
use dennys_dinner;

create table sales(
customer_id varchar(1) ,
order_date date,
product_id int,
constraint cust_id foreign key(customer_id)
references members(customer_id),
constraint FK_pro_id foreign key(product_id)
references menu(product_id)
);
drop table sales;
desc sales;

create table members(
customer_id varchar(1) primary key,
join_Date date
);
desc members;

create table menu(
product_id int primary key,
product_name varchar(5),
price int
);
desc menu;

INSERT INTO sales() VALUES
("A","2021-01-01",1),
("A","2021-01-01",2),
("A","2021-01-07",2),
("A","2021-01-10",3),
("A","2021-01-11",3),
("A","2021-01-11",3),
("B","2021-01-01",2),
("B","2021-01-02",2),
("B","2021-01-04",1),
("B","2021-01-11",1),
("B","2021-01-16",3),
("B","2021-02-01",3),
("B","2021-02-01",3),
("C","2021-01-01",3),
("C","2021-01-01",3),
("C","2021-01-07",3);

INSERT INTO menu VALUES
(1,"sushi",10),
(2,"curry",15),
(3,"ramen",12);

INSERT INTO members VALUES
("A","2021-01-07"),
("B","2021-01-09");


DROP DATABASE dennys_dinner;