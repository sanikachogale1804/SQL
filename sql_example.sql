CREATE DATABASE sanika;

SHOW DATABASES;

USE sanika;

SHOW TABLES;

CREATE TABLE meesho(
full_name VARCHAR(20),
phone INT,
Order_id VARCHAR(20),
product VARCHAR(20),
Payment INT,
delivery_date DATE
);

DESC meesho;

ALTER TABLE meesho ADD COLUMN customer_email VARCHAR(20) AFTER phone;
DESC meesho;

ALTER TABLE meesho DROP COLUMN Payment;
ALTER TABLE meesho DROP COLUMN email;

INSERT INTO meesho VALUES ("sanika chogale",1234321121,"sanika@gmail.com","22","T-shirt","24-07-24");
SELECT * FROM meesho;

ALTER TABLE meesho MODIFY full_name VARCHAR(20) NOT NULL;

ALTER TABLE meesho ADD UNIQUE(full_name);
DESC meesho;
INSERT INTO meesho VALUES ("sneha",1234321121,"sanika@gmail.com","22","T-shirt","24-07-24");



