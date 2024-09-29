create database dennys_dinner;
use dennys_dinner;

create table sales(
customer_id varchar(1),
order_date date,
product_id int 
);
DROP TABLE sales;
DESC sales;
DESC members;
DESC menu;

create table members(
customer_id varchar(1) primary key,
join_Date date
);
DROP TABLE members;
create table menu(
product_id int primary key,
product_name varchar(5),
price int
);
DROP TABLE menu;
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

SELECT * FROM sales;
SELECT * FROM menu;
SELECT * FROM members;

-- What is the total amount each customer spent at the restaurant?
SELECT product_id,product_name,SUM(price) FROM menu
GROUP BY product_id;

-- How many days has each customer visited the restaurant?
SELECT customer_id,COUNT(DISTINCT order_date) FROM sales
GROUP BY customer_id ;

-- what are dishes available in the menu

select product_name from menu
group by product_name;

-- How many customers came to the restaurant on January 1, 2021

select count(customer_id) from sales where order_date="2021-01-01";

-- join table sales and menu
select * from sales s
INNER JOIN menu m
on s.product_id=m.product_id;

-- crate view to see customer_id and order_date from sales
CREATE VIEW sal as
select customer_id,order_date from sales;
select * from sal;

-- Update the price from 10 to 20 wherever it is 10.
UPDATE menu SET price=20 where product_name="sushi";

-- insert one entry into the menu table
insert into menu values(4,"pizza",50);

-- create any one procedure
DELIMITER $$
CREATE PROCEDURE getdata(in id int)
BEGIN
    SELECT * FROM menu WHERE menu.product_id=id;
END$$
DELIMITER ;
drop procedure getdata;
call getdata(1);