CREATE DATABASE riya;

SHOW DATABASES;

USE riya;

CREATE TABLE aplication(
username VARCHAR(20),
pass_word VARCHAR(20),
birth_date DATE
);

DESC aplication; 
DROP TABLE riyaaa;
INSERT INTO aplication(username,pass_word,birth_date) VALUES 
("RIYA", "riya123","06-04-10");
INSERT INTO aplication(username,pass_word,birth_date) VALUES 
("sanikaa", "sanika123","04-07-18");

SELECT * FROM aplication;

SHOW TABLES;

ALTER TABLE aplication ADD COLUMN email VARCHAR(20) AFTER pass_word; 

ALTER TABLE aplication ADD COLUMN address VARCHAR(20) FIRST; 
ALTER TABLE aplication DROP COLUMN address ;

ALTER TABLE aplication CHANGE username u_id INT;
DESC aplication;

ALTER TABLE aplication RENAME TO aplication_details;
DESC aplication_details;


CREATE TABLE department(
d_id CHAR(20) PRIMARY KEY,
d_name VARCHAR(100) NOT NULL
);
DESC department;

CREATE TABLE employee(
e_id CHAR(20) PRIMARY KEY,
e_name VARCHAR(100) NOT NULL,
city VARCHAR(30),
salary INT,
d_id CHAR(20),
CONSTRAINT employee_department FOREIGN KEY(d_id)
REFERENCES department(d_id)
);

DESC employee;
INSERT INTO department VALUES
("D1","Marketing"),
("D2","IT"),
("D3","Human Resources");
SELECT * FROM department;

INSERT INTO employee VALUES
("E1","Nikita","Mumbai",67000,"D1",20),
("E2","prajakta","pune",80000,"D1",25),
("E3","manisha","banglore",20000,"D2",28),
("E4","nilesh","Mumbai",35400,"D2",30),
("E5","monal","pune",34452,"D1",29);
SELECT * FROM employee;

SELECT city as e_city FROM employee;
SELECT (0>7) AS answer;
SELECT e_name,salary FROM employee WHERE e_id="E1";
SELECT d_id FROM employee WHERE e_name="manisha";
SELECT * FROM employee WHERE city="Mumbai";
SELECT * FROM employee WHERE salary<68000;
SELECT * FROM employee WHERE city="Mumbai" and salary<50000;
SELECT * FROM employee WHERE salary>=20000 and salary<=60000;
SELECT * FROM employee WHERE d_id="D2" or city="banglore";
SELECT * FROM employee WHERE city IN("MUMBAI");
SELECT * FROM employee WHERE e_id IN("E1","E2");
UPDATE employee SET e_age=0;

ALTER TABLE employee ADD COLUMN e_age VARCHAR(20);
ALTER TABLE employee CHANGE e_age age INT;
UPDATE employee SET age=25 WHERE e_id="E1";
UPDATE employee SET age=28 WHERE e_id IN("E2","E3");
UPDATE employee SET age=30 WHERE e_id IN("E4","E5");
UPDATE employee SET city="Pune" WHERE e_name="Nikita";
UPDATE employee SET city="Mumbai" WHERE e_name="Prajakta";

select* from employee;
SELECT concat(e_name,"-",city) as concatination from employee;
SELECT * FROM employee ORDER BY e_name DESC LIMIT 1;

-- BUILT IN FUNCTIONS
SELECT concat(e_name,".",city,"@itvedant.com") AS EMAIL FROM employee;
SELECT UPPER(e_name) AS UPPER from employee;
SELECT LOWER(e_name) AS LOWER from employee;
INSERT INTO employee VALUES
("E6",LOWER("ANKITA"),UPPER("pune"),70000,"D2",29);

SELECT SUBSTR("sanika",2,3);
SELECT SUBSTR("nikita",2,4);
SELECT UPPER( SUBSTR(e_name,LENGTH(e_name),1)) from employee;
SELECT UPPER(SUBSTR(city,LENGTH(city),3)) FROM employee;
SELECT CONCAT(city,"-",SUBSTR(e_name,LENGTH(e_name),3)) FROM employee;
SELECT CONCAT(UPPER(SUBSTR(e_name,1,1)),
SUBSTR(e_name,2,LENGTH(e_name)-1),
UPPER(SUBSTR(e_name,LENGTH(e_name),1)))
FROM employee;

SELECT * FROM employee;

ALTER TABLE employee ADD COLUMN gender VARCHAR(20);
UPDATE employee SET gender="F"
WHERE e_id="E1";
UPDATE employee SET gender="F"
WHERE e_id="E2";
UPDATE employee SET gender="F"
WHERE e_id in("E3","E6","E5");
UPDATE employee SET gender="M"
WHERE e_id="E4";
UPDATE employee SET salary=salary+3000 
WHERE e_id="E1";
SELECT * FROM employee WHERE city is NOT NULL;
SELECT * FROM employee WHERE e_name!="manisha";

-- ----------------------------------------------------------------------------
SELECT * FROM employee WHERE e_name LIKE "%a";
SELECT * FROM employee WHERE e_name LIKE "n%";
SELECT * FROM employee WHERE e_name NOT LIKE "M%";
SELECT * FROM employee WHERE e_name LIKE "n_k%";
SELECT * FROM employee WHERE e_name LIKE "%ta";
SELECT * FROM employee WHERE city="pune" and e_name LIKE "m%";
 
-- DAY 
SELECT date_format("2024-02-04","%D-%d");

-- MONTH
SELECT date_format("2022-07-18","%b-%c-%M-%m");

--  YEAR
SELECT date_format("2019-04-10","%j-%Y-%y");

--  WEEK
SELECT date_format("2015-08-20","%a-%W-%w");

-- TIME
SELECT date_format(now(),"%H-%h-%i-%p-%r-%S-%s-%T");


SELECT * from employee
ORDER BY age DESC;

SELECT age FROM employee
GROUP BY age;

SELECT gender,salary from employee
WHERE salary<50000 and gender="M";
SELECT gender,salary from employee
WHERE salary<50000  
GROUP BY gender="M";

DESC department;
DESC employee;
SELECT  d_id,e_id from employee 
GROUP BY d_id
ORDER BY COUNT(d_id);

SELECT d_id,sum(salary) from employee
GROUP BY d_id
ORDER BY sum(salary);

ALTER TABLE employee ADD COLUMN joining_date DATE;

SELECT * FROM employee;

UPDATE employee SET 
joining_date="2024-2-08"
WHERE e_id="E1";
UPDATE employee SET 
joining_date="2012-04-10"
WHERE e_id in("e2", "E6");
UPDATE employee SET
joining_date="2017-05-12"
WHERE e_id in("E3","E5");
UPDATE employee SET
joining_date="2018-07-18"
WHERE e_id="E4";

SELECT * FROM employee 
WHERE YEAR(joining_date)="2017";
SELECT * FROM employee
WHERE DAY(joining_date)="18";


SELECT
e.e_name,d.d_name
FROM employee AS e
INNER JOIN department AS d
ON
e.d_id=d.d_id;

DESC department;
SELECT gender from employee
group  by gender
Having gender="f";

SELECT avg(salary) from employee
GROUP BY d_id;

SELECT * FROM employee;
SELECT * FROM department;
DESC employee;
SELECT d_id,COUNT(e_id) FROM employee
GROUP BY d_id
ORDER BY count(e_id) LIMIT 1;

INSERT INTO employee VALUES
("E7","sanika","pune",90000,"D3",21,"F","2013-05-19");

UPDATE employee SET city=Upper("Pune") WHERE e_id="E7";

-- CASE-------------------------------------------------
SELECT *,salary,
CASE
WHEN salary<25000 THEN "very less"
WHEN salary<40000 THEN "average"
WHEN salary<75000 THEN "high"
WHEN salary<95000 THEN "very high"
ELSE "-"
END AS salary_details
FROM employee;

SELECT e_name,city,
 CASE
 WHEN d_id="D1" THEN "Marketing"
 WHEN d_id="D2" THEN "IT"
 WHEN e_id="D3" THEN "HUMAN resources"
 ELSE "-"
 END As department
 from employee;

DESC department;
DESC employee;
ALTER TABLE employee CHANGE d_id department_id CHAR(20);
ALTER TABLE employee DROP PRIMARY KEY;
-- INNER JOIN
SELECT * FROM employee
INNER JOIN department
ON
employee.department_id=department.d_id;


-- LEFT JOIN
SELECT *
FROM employee e
LEFT JOIN department d
ON
e.department_id=d.d_id;

-- RIGHT JOIN
SELECT * 
FROM employee e
RIGHT JOIN department d
ON
e.department_id=d.d_id
WHERE salary<50000;

-- CROSS JOIN
SELECT * FROM employee,department
GROUP BY department_id;

SELECT * FROM department_2;
DESC department_2;
CREATE TABLE department_2(
d_id INT PRIMARY KEY,
d_name VARCHAR(20),
d_city VARCHAR(20));

ALTER TABLE department_2 CHANGE d_id d_id CHAR(20);
INSERT INTO department_2 VALUES
("D1","Marketing","Mumbai"),
("D2","training","pune");

-- UNION APKO BAS DISTINCT VALUE HI DIKHAYEGA MATLAB NON REPEATING VALUE AND UNION ALL APKO SAB VALUES DIKHAYEGA
SELECT d_id,d_name  FROM department
UNION ALL
SELECT d_id,d_name from department_2;

SELECT * FROM employee;
SELECT * FROM department;
UPDATE employee SET city=NOT null WHERE department_id="D1";
UPDATE employee SET city=Upper("Pune") WHERE e_id="E1";

-- FULL OUTER JOIN(LEFT JOIN OR RIGHT JOIN KA COMBINATION)
SELECT * from 
employee e
LEFT JOIN department d
on
e.department_id=d.d_id
UNION 
SELECT * FROM 
employee e
RIGHT JOIN department d
ON
e.department_id=d.d_id;

-- cross join (multiplication with second table)
SELECT * FROM employee,department;

-- EQUI JOIN (CROSS JOIN KO EQUI JOIN BOLTE HAI)
SELECT * FROM employee e,department d
WHERE e.department_id=d.d_id;

SELECT * FROM employee e,department d
WHERE e.department_id=d.d_id and salary<50000 ;

SELECT MIN(salary) from employee;
-- subquery
SELECT * FROM employee WHERE salary=(SELECT MIN(salary) from employee);

ALTER TABLE department ADD COLUMN d_city VARCHAR(30);
UPDATE department SET d_city="mumbai" WHERE d_id="D1";
UPDATE department SET d_city=UPPER("pune") WHERE d_id="D2";
UPDATE department SET d_city="mumbai" WHERE d_id="D3";


-- subquery
SELECT d_id FROM department WHERE d_city="mumbai";
SELECT city FROM employee WHERE department_id in (SELECT d_id FROM department WHERE d_city="mumbai");

SELECT min(salary) from employee;
SELECT * FROM employee 
WHERE salary>(SELECT min(salary) from employee) ;

SELECT max(salary) from employee;
SELECT * FROM employee
WHERE salary>=(SELECT max(salary) from employee) 
ORDER BY salary DESC  ;

DESC department;
select* FROM employee;
SELECT * FROM department;
SELECT * FROM employee where department_id=
(SELECT d_id FROM department WHERE d_name="marketing");

SELECT * FROM employee where department_id in
(SELECT d_id from department WHERE d_city="mumbai");

-- less than all and any            35400             70000
SELECT * from employee WHERE e_name="nilesh" or e_name="ankita";
	-- less than all matlab dono me se choti value dekhi jayegi
SELECT * FROM employee where salary<all(SELECT salary from employee WHERE e_name="nilesh" or e_name="ankita");
-- greater than all matlab dono me se badi value dekhi jayegi
SELECT * FROM employee where salary>all(SELECT salary from employee WHERE e_name="monal" or e_name="ankita");

--  less than any matlab dono me se konsi bhi choti value dekhi jayegi            35400              70000
SELECT * FROM employee where salary<any(SELECT salary from employee WHERE e_name="nilesh" or e_name="ankita");
--  greater than any 
SELECT * FROM employee where salary>any(SELECT salary from employee WHERE e_name="nilesh" or e_name="ankita");


SELECT * FROM employee;
--  VIEW
CREATE VIEW emp as
SELECT e_id,e_name,city,department_id,age,gender from employee;
SELECT * FROM emp;

CREATE VIEW d_salary as
SELECT department_id,sum(salary) from employee
GROUP BY department_id;
SELECT * FROM d_salary;

CREATE VIEW name_upper as
SELECT upper(e_name) from employee;
SELECT * FROM name_upper;

SELECT * FROM department;
DESC department;
INSERT INTO department VALUES 
("D4","Training",null);

SELECT * 
FROM employee e
RIGHT JOIN department d
on
e.department_name=d.d_id;

SELECT * FROM employee WHERE salary>
(SELECT min(salary) from employee);

DELIMITER $$
CREATE PROCEDURE get_employee()
BEGIN
   
   select * from employee;

END $$
DELIMITER ;
CALL get_employee();

DELIMITER $$
CREATE procedure get_department()
BEGIN

   select e_id,e_name,salary,department_id,age from employee;

END$$
DELIMITER ;

select * from employee;
SELECT * FROM department;
DROP PROCEDURE get_department;
DELIMITER $$
CREATE PROCEDURE get_department(in department_id int)
BEGIN

     SELECT*FROM employee WHERE employee.department_id=department_id;

END$$
DELIMITER ;
drop procedure get_department;
call get_department("d2");


ALTER TABLE employee ADD COLUMN phone_no bigint;
select * from employee;


UPDATE employee SET phone_no=7208381119 WHERE department_id="d1";
UPDATE employee SET city="pune" where e_name="nikita";


UPDATE employee SET city="Mumbai" WHERE e_name="Prajakta";

select * from employee;
desc employee;

UPDATE employee SET city="banglore" WHERE e_name="nikita";
select * from employee;
set sql_safe_updates=0;
set sql_safe_updates=1;
DELIMITER $$
CREATE PROCEDURE update_phoneno(in e_id int, in phone_no bigint(20))
BEGIN

    UPDATE employee set employee.phone_no=phone_no where employee.e_id=e_id;

END$$
DELIMITER ;
drop procedure update_phoneno;
call update_phoneno("E1","7208381119");


--  getcount("mumbai",@countempl)
--  getempdetails("d1")
--  getemployee("A")
--  getemployee count("A", @countemp)

SELECT * FROM employee;
SELECT * FROM employee where e_id="E1";
SELECT e_name,city FROM employee WHERE salary=70000 or salary=80000;

UPDATE employee set city="pune" where e_id="E1";
UPDATE employee set city="banglore" where e_id in("e2","e4");
UPDATE employee set city="panjab" where e_name="ankita";


-- LIKE OPERATOR
SELECT * FROM employee WHERE e_NAME LIKE"n%";
SELECT * FROM employee where e_name like"%h";
SELECT * FROM employee WHERE e_NAME LIKE"n%" or e_name like"%n";
SELECT * FROM employee WHERE e_NAME LIKE"_r%";
SELECT * FROM employee WHERE e_NAME LIKE"%h_";
SELECT * FROM employee WHERE e_NAME LIKE"%e__";
SELECT * FROM employee WHERE e_NAME LIKE"s%a";


-- Aggreagate function
-- sum

SELECT sum(salary) from employee;

-- count 
SELECT count(e_name) FROM employee where salary<50000;

-- min
SELECT min(salary) from employee;

-- max
SELECT max(age) from employee;

-- avg
select avg(salary) from employee;

SELECT count(d_id) as number_od_departments from department;

select distinct city from employee;
select distinct age from employee;

SELECT salary from employee order by salary ;
SELECT salary from employee order by salary desc limit 2 ;
SELECT * FROM employee order by salary desc,age desc;

select count(e_name) from employee where salary>80000 and gender="f";

SELECT department_id,count(e_id) from employee 
group by department_id
order by e_id desc;

-- subquery
select * from employee where salary=
(SELECT min(salary) from employee);
select * from employee where age>=
(select max(age) from employee);

select * from employee ;
DELIMITER $$
CREATE PROCEDUre get_employee()
BEGIN
 
 select * from employee;
END$$
DELIMITER ;
call get_employee();
drop procedure get_employee;
drop procedure get_departmentid;

select * from department;
select * from department where d_name="marketing"; 
DESC EMPLOYEE;

DELIMITER $$
CREATE PROCEDUre get_by_city(IN city varchar(20))
BEGIN
select count(*) from employee where employee.city=city;
END$$
DELIMITER ;
call get_by_city("panjab");

select count(*) from employee where city="pune";
select count(*) from employee where gender="f";


DELIMITER $$
CREATE PROCEDURE get_gender(in gender varchar(5))
begin
   select count(*) from employee where employee.gender=gender;
end $$
delimiter ;
call get_gender("m");

--  getcount("mumbai",@countempl)
select count(e_id) from employee where city="mumbai";
desc employee;
delimiter $$
create procedure count_empl(in city varchar(20),out id char(10))
begin
    select count(e_id) into id from employee where employee.city=city;
end$$
delimiter ;
call count_empl("pune",@id);
select @id;


--  getempdetails("d1")
delimiter $$
create procedure get_empdetails(in d_id char(5))
begin
    select * from employee where employee.department_id=d_id;
end$$
delimiter ;
call get_empdetails("d2");
select * from employee where department_id="d1";

--  getemployee("A")
select * from employee where e_name like"a%";
delimiter $$
create procedure get_employee(in startletter varchar(20))
begin
    select * from employee where employee.e_name like concat(startletter,"a%");
end $$
delimiter ;
drop procedure get_employee;
call get_employee("a%");

--  getemployee count("A", @countemp)
select count(e_id) from employee where e_name like"a%";

-- count(ch,"%")
delimiter $$
create procedure count_emp(in e_id int , out e_name varchar(20))
begin
select count(e_id) into e_name  from employee where employee.e_name like"a%";
end$$
delimiter ;
call count_emp("e1",@e_name);
select @e_name;

select * from employee;
select * from employee where e_id="e1";

desc employee;
delimiter $$
create procedure get_id(in emp_id char(20))
begin
    select salary from employee where employee.e_id=emp_id;
end$$
delimiter ;
drop procedure get_id;
call get_id("e5");

delimiter $$
create procedure get_sal(in emp_id char(20), out e_Salary int )
begin
  select salary into e_salary from employee where employee.e_id=emp_id;
end$$
delimiter ;
drop procedure get_sal;
call get_sal("e5",@e_salary);
select @e_salary as emp_Salary;

-- inout procedure
delimiter $$
create procedure updatesalary(in id char,inout e_salary int )
begin
    declare old_Salary int;
    select employee.salary into old_Salary from employee where employee.e_id=id;
    update employee set employee.salary=e_salary where employee.e_id=id;
    set e_Salary=old_salary;
end$$
delimiter ;
drop procedure updatesalary;
set @e_Salary=90000;
call updatesalary("e2",@e_salary);
select @e_salary;

delimiter $$
create procedure updateage(in e_id char,inout age int )
begin
	declare old_age int;
    select employee.age into old_age from employee where employee.e_id=e_id;
    update employee set employee.age=age where employee.e_id=e_id;
    set age=old_age;
end$$
delimiter ;
drop procedure updateage;
set @age=30;
call updateage("e1",@age);
select @age;

-- ---------------------------------------------------------------------------
delimiter $$
create function addition(a int,b int)
returns int
begin
     return a+b;
end$$
delimiter ;
select addition(100,20);

delimiter $$
create function subtraction(a int,b int)
returns int
begin
    return a-b;
end$$
delimiter ;
drop function subtraction;
select subtraction(200,10);

 delimiter $$
create function uppername(word char(50))
returns varchar(50)
begin
    return concat(upper(substr(word,1,1)),lower(substr(word,2)));
end$$
delimiter ;
drop function uppername;
select uppername("sanika");

select uppername(employee.city);

delimiter $$
create procedure getage(in e_age int)
begin
   select * from employee where employee.age=e_age;
end $$
delimiter ;
drop procedure getage;
call getage(25);
select * from employee;  
desc employee;

select (e_id) from employee where age=25;

select e_name from employee where e_id="e1";

delimiter $$
create procedure empname(in id char(10))
begin
   select e_name from employee where employee.e_id=id;
end$$
delimiter ;
drop procedure empname;
call empname("e7");

delimiter $$
create procedure  getcity(in city varchar(10))
begin
    select e_name from employee where employee.city=city;
end$$
delimiter ;
call getcity("mumbai");

select city from employee where e_name="nikita";

select e_id from employee where department_id="d1";
delimiter $$
create procedure getdepartment(in department char(5))
begin
    select e_id from employee where employee.department_id=department;
end$$
delimiter ;
call getdepartment("d3");

-- getsalary("1111",50000)
DELIMITER $$
CREATE PROCEDURE getsalary(IN e_id CHAR(5), out salary INT)
BEGIN
		  -- column_name   variable name(jisme value store hoti hai)                     column_name   variable_name
     SELECT  e_salary into salary                                   from employee  where employee.e_id=e_id; 

END$$
DELIMITER ;
drop procedure getsalary;
call getsalary(1113,@salary);
SELECT @salary;
SELECT e_salary from employee where e_id=1111;
 
-- output procedure
-- getage("e1",25)
select age from employee where e_id="e1";
delimiter $$
create procedure getage(in emp_id char(10),out e_age int)
begin
    select age INTO e_age from employee where employee.e_id=emp_id;
end$$
delimiter ;
drop procedure getage;
CALL getage("e1",@e_age);
select @e_age;
select * from employee;

delimiter $$
create procedure get_sal(in emp_id char(20), out e_Salary int )
begin
  select salary into e_salary from employee where employee.e_id=emp_id;
end$$
delimiter ;
drop procedure get_sal;
call get_sal("e5",@e_salary);
select @e_salary as emp_Salary;

select phone_no,e_name from employee where department_id="d2";

delimiter $$
create procedure getphone(in id char(4),out phone bigint)
begin
    select phone_no INTO phone  from employee where employee.e_id=id;
end$$
delimiter ;
drop procedure getphone;
call getphone("e1",@phone);
select @phone;

-- INOUT PROCEDURE
delimiter $$
create procedure updatesalary(in e_id int,inout Salary int)
begin
	declare old_salary int;
    select employee.e_salary into old_Salary from employee where employee.e_id=e_id;
    update employee set employee.e_salary=salary where employee.e_id=e_id;
    set Salary=old_Salary;
end$$
delimiter ;
set @salary=90000;
call updatesalary(1111,@salary);
select @salary;

DELIMITER $$
CREATE PROCEDURE updatesalary(in id char(5),inout e_salary int)
BEGIN 
      declare old_Salary int;
      select employee.salary INTO old_Salary from employee WHERE employee.e_id=id;
      update employee SET employee.salary=e_salary where employee.e_id=id;
      SET e_salary=old_Salary;
END$$
DELIMITER ;
drop procedure updatesalary;
set @e_Salary=80000;
CALL updatesalary("e1",@e_Salary);
select @e_Salary;

DELIMITER $$
CREATE PROCEDURE updateage (in namee varchar(10), inout e_age int )
BEGIN
   DECLARE old_age int;
   SELECT employee.age INTO old_AGE FROM employee WHERE employee.e_name=namee;
   UPDATE employee SET employee.age=e_age WHERE employee.e_name=namee;
   SET e_age=old_Age;
END$$
DELIMITER ;
DROP PROCEDURE updateage;
SET @e_age=32;
CALL updateage("prajakta",@e_age);
SELECT * from employee;
SELECT @e_age;

DELIMITER $$
CREATE PROCEDURE updatedate(in e_id char(5),inout join_date DATE)
BEGIN
  DECLARE old_joindate date;
  SELECT employee.joining_date INTO old_joindate from employee WHERE employee.e_id=e_id;
  UPDATE employee SET employee.joining_date=join_date WHERE employee.e_id=e_id;
  SET join_date=old_joindate;
END$$
DELIMITER ;
SET @join_date="2022-02-08";
call updatedate("E1",@join_date);
SELECT @join_Date;

-- CREATE FUNCTION
DELIMITER $$
CREATE FUNCTION formatname(word varchar(100))
RETURNS VARCHAR(100)
BEGIN
   RETURN CONCAT(UPPER(SUBSTR(word,1,1)),SUBSTR(word,2,UPPER(LENGTH(WORD)-1)));
END$$
DELIMITER ;
drop function formatname;
SELECT formatname("sanika");

DELIMITER $$
CREATE FUNCTION grade(marks int)
RETURNS VARCHAR(10)
BEGIN
    DECLARE grade char(20);
    SET grade=CASE
       WHEN marks between 0 AND 40 THEN "C"
       WHEN marks between 40 AND 70 THEN "B"
       WHEN marks between 70 AND 100 THEN "A"
       ELSE
       "invalid marks"
       end;
       return grade;
END$$
DELIMITER ;
SELECT grade(75);

-- IF ELSE STATEMENT
DELIMITER $$
CREATE FUNCTION checkage(age int)
RETURNS BOOL
BEGIN
    IF (age>18) THEN
    RETURN TRUE;
    ELSE 
    RETURN FALSE;
END IF;    
END$$
DELIMITER ;
select checkage(17)

DELIMITER $$
CREATE FUNCTION selectday(days int)
RETURNS VARCHAR(20)
BEGIN
    IF (days=1) THEN
    RETURN "Monday";
    ELSEIF (days=2) THEN
    RETURN "Tuesday";
    ELSEIF (days=3) THEN
    RETURN "Wednesday";
    ELSEIF (days=4) THEN
    RETURN "Thursday";
    ELSEIF (days=5) THEN
    RETURN "Friday";
    ELSEIF (days=6) THEN
    RETURN "Saturday";
    ELSEIF (days=7) THEN
    RETURN "Sunday";
    ELSE 
	RETURN "INVALID CHOICE";
END IF;    
END$$
DELIMITER ;
select selectday(7);

SELECT MOD(20,6);
SELECT ROUND(50.2567,2);    -- round madhe je last la digit lihtat tevdhech point pudhche number ghetle jatat
SELECT ROUND(5.7856,3);
SELECT ROUND(2.67887,4);
-- POINT KE PEHLE KA NUMBER HI MILEGA
SELECT FLOOR(32087.50);

SELECT CEIL(2056.50);
SELECT CEIL(2345.674);
SELECT SQRT(16);
SELECT SQRT(25635);
-- SIGN BATAYEGA KI NUMBER POSITIVE HAI KI NEGATIVE HAI
SELECT SIGN(450);
SELECT SIGN(-546);
SELECT SIGN(0);

-- ROUND OF NAHI KAREGA BAS KAM KAREGA
SELECT TRUNCATE(1233.454342,2);
SELECT TRUNCATE(1234.566878,4);
SELECT ROUND(653.26536,3);

SELECT POW(6,3);
SELECT POW(12,3);


-------------------------------------------------------------------
-- LOOP SYNTAX
/* Labelname: Loop
 IF condition THEN 
    LEAVE labelname;
    END IF;
END LOOP Labelname;
*/

-- SSIMPLE LOOP
DELIMITER $$
CREATE PROCEDURE loopexample() 
BEGIN
     DECLARE i INT;
     SET i=1;
     
     simpleloop: LOOP
     IF i=6 THEN 
        LEAVE simpleloop;
     END IF;
     SELECT "HELLO";
     SET i=i+1;
     END LOOP simpleloop;
END$$
DELIMITER ;
CALL loopexample();

DELIMITER $$
CREATE PROCEDURE printnum()
BEGIN
   DECLARE i INT;
   SET i=1;
    
    simpleloop1 : LOOP
	IF i=6 THEN
       LEAVE simpleloop1;
    END IF;
    SELECT i;
    SET i=i+1;
   END LOOP simpleloop1;
END$$
DELIMITER ;
CALL printnum();

DELIMITER $$
CREATE PROCEDURE numprint()
BEGIN
    DECLARE i INT;
    SET i=1;
    
    simpleloop1: LOOP
    IF i=10 THEN 
       LEAVE simpleloop1;
	END IF;
   SELECT i;
    SET i=i+1;
 END LOOP simpleloop1;    
END $$
DELIMITER ;
CALL numprint();
DROP PROCEDURE numprint;

CREATE TABLE empp(
e_id VARCHAR(10)
);
DELIMITER $$
CREATE PROCEDURE print1to10()
BEGIN
    DECLARE i INT;
    SET i=1;
    
    loopexample: LOOP
    IF i=10 THEN 
        LEAVE loopexample;
    END IF;
    INSERT INTO empp VALUES  (CONCAT("emp",i));
END LOOP loopexample;
END$$
DELIMITER ;
CALL print1to10;
DROP PROCEDURE print1to10;
DROP TABLE empp;
SHOW TABLES;
DESC empp;
SELECT * FROM empp;


-- WHILE LOOP

DELIMITER $$
CREATE PROCEDURE whileloopexample()
BEGIN
    DECLARE i INT;
    SET i=1;
    
    whileloop: WHILE
    i<=10 DO
       SELECT i;
       SET i=i+1;
	END WHILE whileloop;
END$$
DELIMITER ;
CALL whileloopexample;

DELIMITER $$
CREATE PROCEDURE whileloopexample1()
BEGIN
    DECLARE i INT;
    SET i=10;
    
    print11to20: WHILE
    i<=100 DO
       SELECT i;
       SET i=i+10;
END WHILE print11to20;
END$$
DELIMITER ;
CALL whileloopexample1();
DROP PROCEDURE whileloopexample1;

DELIMITER $$
CREATE PROCEDURE whileloopexample2()
BEGIN
    DECLARE i INT;
    SELECT i=4;
    
    printtable : WHILE
    i<=40 DO
    IF i%4=0 THEN
       SELECT i;
	END IF;
    SET i=i+2;
END WHILE printtable;
END;
DELIMITER ;
CALL whileloopexample2();
DROP PROCEDURE whileloopexample2;

DELIMITER $$
CREATE PROCEDURE whileloopexample5()
BEGIN
     DECLARE i INT;
     SET i=4;
     
     printtable4: WHILE
     i<=40 DO
     IF i%4=0 THEN 
        SELECT i;
	END IF;
	SET i=i+2;
	END WHILE printtable4;
END;
DELIMITER ;

-- EXCEPTIONS normal flow of code ko distrub karta hai

CREATE TABLE student_details(
s_id INT NOT NULL
);

DELIMITER $$
CREATE PROCEDURE exceptionhandling(IN s_id INT)
BEGIN
     DECLARE CONTINUE HANDLER FOR 1048
     BEGIN
       SELECT "You canot insert null value";
     END;
    INSERT INTO student_details VALUES (s_id);
    SELECT "code of insertion";
END$$
DELIMITER ;
CALL exceptionhandling(null);
DROP PROCEDURE exceptionhandling;
select * from student_details;

DELIMITER $$
CREATE PROCEDURE whileloopexamp3()
BEGIN
    DECLARE i INT;
    SET i=1;
    
    print1too10: WHILE
    i<=10 DO
       SELECT i ;
       SET i=i+2;
	END WHILE print1too10;
END$$
DELIMITER ;
DROP PROCEDURE whileloopexamp3;
CALL whileloopexamp3();

SELECT * FROM employee;
SELECT e_id,e_name from employee;
DELIMITER $$
CREATE PROCEDURE cursor_example()
BEGIN
    DECLARE emp_id CHAR(10);
    DECLARE emp_name VARCHAR(10);
    DECLARE n INT;
    
    DECLARE employee_cursor CURSOR FOR
    SELECT e_id,e_name from employee;
    
    DECLARE CONTINUE HANDLER FOR 1329
    BEGIN
       SET n=1;
	END;
    OPEN employee_cursor;
    
    cursorloop: LOOP
    IF n=1 THEN 
       LEAVE cursorloop;
	END IF;
    FETCH employee_cursor INTO emp_id,emp_name;
    SELECT emp_id,emp_name;
    END LOOP cursorloop;
   
   SELECT "HELLO";
    CLOSE employee_cursor;

END$$
DELIMITER ;
CALL cursor_example();
DROP PROCEDURE cursor_example;

SELECT * FROM employee;

DELIMITER $$
CREATE PROCEDURE update_age(IN emp_id VARCHAR(5),INOUT e_age INT)
BEGIN
    DECLARE old_age INT;
    SELECT employee.age INTO old_Age from employee WHERE  employee.e_id=emp_id;
    UPDATE employee SET employee.age=e_age WHERE employee.e_id=emp_id;
    SET e_Age=old_age;
END$$
DELIMITER ;
SET @e_age=25;
CALL update_age("E1",@e_age);
SELECT @e_age;




