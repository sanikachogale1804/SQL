CREATE DATABASE case_study;
use case_study;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);
drop table customers;
SELECT * from customers;

CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT,
    available_copies INT NOT NULL
);
drop table movies;

CREATE TABLE Rentals (
    rental_id INT PRIMARY KEY,
    customer_id INT,
    movie_id INT,
    return_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);
desc rentals;
drop table rentals;

INSERT INTO Customers (customer_id,first_name, last_name, email) VALUES
(101,"sanika", "chogale", "sanika@example.com"),
(102,"sneha", "khandagale", "sneha@example.com"),
(103,"akshata", "sawant", "akshata@example.com");

INSERT INTO Movies (movie_id,title, release_year, available_copies) VALUES
(1,"harry potter", 1994, 5),
(2,"The Godfather", 1972, 3),
(3,"maharaj", 1982, 6),
(4,"Tanaji", 2010, 4);

select * from customers;
INSERT INTO Rentals (rental_id,customer_id, movie_id,return_date) VALUES
(4,101, 1, '2024-08-01'),
(5,102, 2, '2024-08-02'),
(6,103, 3, '2024-08-03');

drop table rentals;
select * from rentals;
select * from movies;

-- Get all customers:
SELECT * FROM Customers;

-- Get all movies with their available copies:
SELECT title, available_copies FROM Movies;

-- count the movies
SELECT count(title) from movies;

-- join tables movies and rentals
select * from movies m
inner join rentals r
on
r.movie_id=m.movie_id; 

-- create view to display customer_id,first_name,last_name from customers
CREATE view cust as
select customer_id,first_name,last_name from customers;
select * from cust;

-- Which movie has how many copies available
SELECT  title,available_copies from movies
GROUP BY title ;

-- create procedure
DELIMITER $$
CREATE PROCEDURE getemail(in id INT)
BEGIN
    select * From customers where customers.customer_id=id;
END$$
DELIMITER ;
call getemail(102);
drop procedure getemail;

-- Find out a movie whose name ends with 'r';
SELECT * FROM movies WHERE title LIKE "%r";

