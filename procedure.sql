create database student_management_sanika; 
  
use student_management_sanika; 
  
CREATE TABLE Students ( 
    StudentID INT PRIMARY KEY, 
    Name VARCHAR(255), 
    DateOfBirth DATE, 
    GradeLevel INT 
); 
  
CREATE TABLE Teachers ( 
    TeacherID INT PRIMARY KEY, 
    Name VARCHAR(255), 
    Subject VARCHAR(255) 
); 
  
CREATE TABLE Courses ( 
    CourseID INT PRIMARY KEY, 
    CourseName VARCHAR(255), 
    TeacherID INT, 
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID) 
); 
  
CREATE TABLE Enrollments ( 
    EnrollmentID INT PRIMARY KEY, 
    StudentID INT, 
    CourseID INT, 
    EnrollmentDate DATE, 
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID), 
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) 
); 
  
  
  
INSERT INTO Students (StudentID, Name, DateOfBirth, GradeLevel) VALUES 
    (1, 'Alice Johnson', '2005-03-15', 9), 
    (2, 'Bob Smith', '2004-08-22', 10), 
    (3, 'Charlie Brown', '2006-05-10', 8), 
     (4, 'Van Johnson', '2005-03-15', 9), 
    (5, 'Smith hen', '2004-08-22', 10), 
    (6, ' Brown', '2006-05-10', 8); 
    
    
   
  
INSERT INTO Teachers (TeacherID, Name, Subject) VALUES 
    (1, 'Ms. Davis', 'Math'), 
    (2, 'Mr. Johnson', 'English'), 
    (3, 'Mrs. Smith', 'Science'); 
  
INSERT INTO Courses (CourseID, CourseName, TeacherID) VALUES 
    (101, 'Algebra', 1), 
    (102, 'Literature', 2), 
    (103, 'Biology', 3), 
     (104, 'Geomentry', 1), 
    (105, 'Zoology', 3); 
  
  
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES 
    (1001, 1, 101, '2023-01-15'), 
    (1002, 2, 102, '2023-02-20'), 
    (1003, 3, 103, '2023-03-25'); 
    
    
    SELECT * FROM students;
    SELECT avg(GradeLevel) from students;
    
    SELECT * FROM teachers;
    SELECT * FROM courses;
    
    SELECT teacherid,count(courseid) from courses group by teacherid;
    
    SELECT t.name,count(c.courseid) FROM teachers t
    left join courses c
    on
    t.teacherid=c.teacherid
    group by t.name;
    
    SELECT subject,count(courseid) FROM teachers t
    left join courses c
    on 
    t.teacherid=c.teacherid
    group by subject;
    
    
    -- USING- agar column ke name same hai to using use karenge 
    
    
    SELECT * FROM teachers t
    left join courses c
    using(teacherid);
    
    CREATE VIEW table_details as 
    select s.name,t.name as teachers_name from students s 
    left join 
    enrollments e
    using(studentid)
    left join 
    courses c
    using(courseid)
    left join
    teachers t
    using(teacherid);
    
    SELECT * FROM table_details;
    
    -- -------------------------------------------------------------------------
    -- curson one by one agar statement pe kam karna hai to use karte hai
-- cursor is a pointer to row by row peform action

-- STEPS FOR CURSOR
/*
1)Declare Cursor 
    DECLARE sursor_name CURSOR FOR select query;
    DECLARE s CURSOR for SELECT id FROM students;
2)OPEN Cursor
    OPEN cursor_name;
    OPEN s;
3)Fetch Cursor
    FETCH cursor_name INTO variable_list;
    FETCH s INTO student_id;
4)CLOSE Cursor
    CLOSE cursor_name;
    CLOSE s;
*/
    
    SELECT * FROM students;
    
    SELECT studentid,name from students;
    
DELIMITER $$
CREATE PROCEDURE cursor_example()
BEGIN
    DECLARE s_id INT;
    DECLARE s_name varchar(30);
    DECLARE n INT;
    
    DECLARE student_cursor CURSOR FOR
    SELECT studentid,name from students;
    
    DECLARE CONTINUE HANDLER FOR 1329
    BEGIN
     SET n=1;
     END;
    OPEN student_cursor;
    
    cursorloop: LOOP
    IF n=1 THEN
      LEAVE cursorloop;
      END IF;
    FETCH student_cursor INTO s_id,s_name ;
    SELECT s_id,s_name;
    END LOOP cursorloop;
    
    SELECT "HELLO";
    
    CLOSE student_cursor;
    
END$$
DELIMITER ;
CALL cursor_example();
DROP PROCEDURE cursor_example;
show tables;
SELECT * FROM courses;
SELECT * FROM enrollments;


select * from teachers;
select * from courses;
CREATE TABLE teachers_courses(
  cname VARCHAR(100),
  tname VARCHAR(100)
);
SELECT * FROM teachers_courses;

SELECT t.name,c.coursename from teachers t
JOIN courses c
USING (teacherid);

DELIMITER $$
CREATE PROCEDURE insert_into_values()
BEGIN
    DECLARE cname VARCHAR(100);
    DECLARE tname VARCHAR(100);
    DECLARE n INT;
    
    DECLARE teachers_courses CURSOR FOR
      SELECT t.name,c.coursename from teachers t
      JOIN courses c
      USING (teacherid);

    DECLARE CONTINUE HANDLER FOR 1329
      BEGIN
         SET n=1;
      END;
    OPEN teachers_courses;
    
    teachers_courses_loop: LOOP
     FETCH teachers_courses INTO cname,tname;
    IF n=1 THEN 
       LEAVE teachers_courses_loop;
    END IF;
   
    INSERT INTO student_management_sanika.teachers_courses VALUES(cname,tname);
    END LOOP teachers_courses_loop;
    
    CLOSE teachers_courses ;

END $$
DELIMITER ;
CALL insert_into_values();
SELECT * FROM teachers_courses;
DROP PROCEDURE insert_into_values;
TRUNCATE TABLE teachers_courses;

SELECT * FROM ENROLLMENTS;
SELECT * FROM STUDENTS;

CREATE TABLE enrollments_teachers(
sid INT,
e_id INT
);
DESC enrollments_teachers;
SELECT * FROM enrollments_teachers;

SELECT s.studentid,e.enrollmentid,s.name FROM ENROLLMENTS e
JOIN students s
USING (studentId);

DELIMITER $$
CREATE PROCEDURE insert_values_using_cursor()
BEGIN
    DECLARE sid INT;
    DECLARE e_id INT;
    DECLARE n INT;
    
    DECLARE enrollments_teachers CURSOR FOR
       SELECT s.studentid,e.enrollmentid FROM ENROLLMENTS e
       JOIN students s
       USING (studentId);
       
       DECLARE CONTINUE HANDLER FOR 1329
       BEGIN
       SET n=1;
       END;
       
	OPEN enrollments_teachers;
    
    enrollments_teachers_loop:LOOP
     FETCH enrollments_teachers INTO sid,e_id;
    IF n=1 THEN 
    LEAVE enrollments_teachers_loop;
    END IF;
    INSERT INTO student_management_sanika.enrollments_teachers VALUES(sid,e_id);
    END LOOP enrollments_teachers_loop;
    
    CLOSE enrollments_teachers;
    
END$$
DELIMITER ;
CALL insert_values_using_cursor();
SELECT * FROM enrollments_teachers;
DROP PROCEDURE insert_values_using_cursor;
TRUNCATE TABLE enrollments_teachers;


-- Trigger 
-- Trigger ko call nahi karna padta 

SHOW TABLES;

CREATE TABLE employee(
e_name VARCHAR(20),
working_hours INT,
Pay_per_hours INT,
Salary INT
);

INSERT INTO employee(e_name,working_hours,Pay_per_hours) VALUES ("Riya",7,700);
SELECT * FROM employee;

DELIMITER $$
CREATE TRIGGER before_insert_value
BEFORE INSERT
ON employee FOR EACH ROW
BEGIN
    SET new.salary=new.working_hours*new.pay_per_hours;
END$$
DELIMITER ;

-- INSERT Trigger
INSERT INTO employee(e_name,working_hours,Pay_per_hours) VALUES ("SANIKA",8,1000);
INSERT INTO employee(e_name,working_hours,Pay_per_hours) VALUES ("Akshata",4,758);
INSERT INTO employee(e_name,working_hours,Pay_per_hours) VALUES ("sneha",7,1000);

UPDATE employee SET working_hours=9 WHERE e_name="sanika";


-- UPDATE Trigger
DELIMITER $$
CREATE TRIGGER before_update_trigger
BEFORE UPDATE
ON employee FOR EACH ROW
BEGIN
     SET NEW.salary=NEW.working_hours*NEW.Pay_per_hours;
END$$
DELIMITER ;
UPDATE employee SET pay_per_hours=800 WHERE e_name="sneha";

ALTER TABLE employee ADD COLUMN previous_pay INT;
SELECT * FROM employee;
-- UPDATE TRIGGER FOR OLD VALUE

DELIMITER $$
CREATE TRIGGER Before_update_employee_pay_per_hours
BEFORE UPDATE
ON employee FOR EACH ROW
BEGIN
    SET NEW.Previous_Pay=OLD.pay_per_hours;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER Before_update_Pay_per_hours_notequalto_previous_pay
BEFORE UPDATE
ON employee FOR EACH ROW
BEGIN
    SET NEW.pay_per_hours=!OLD.Previous_pay;
END$$
DELIMITER ;
DROP TRIGGER Before_update_Pay_per_hours_notequalto_previous_pay;

UPDATE employee SET Pay_per_hours=3000 WHERE e_name="sanika";

UPDATE employee SET Pay_per_hours=2000 WHERE e_name="sanika";
UPDATE employee SET Pay_per_hours=100 WHERE e_name="sneha";
UPDATE employee SET Pay_per_hours=453 WHERE e_name="akshata";
UPDATE employee SET Pay_per_hours=500 WHERE e_name="riya";

ALTER TABLE employee ADD COLUMN d_id CHAR(10);
UPDATE employee SET d_id="D1" WHERE e_name="sanika";
UPDATE employee SET d_id="D2" WHERE e_name="akshata";
UPDATE employee SET d_id="D3" WHERE e_name="sneha";

CREATE TABLE department(
d_id CHAR(10),
d_name VARCHAR(10)
);
SELECT * FROM department;
INSERT INTO department VALUES 
("D1","IT"),
("D2","Marketing"),
("D3","Services");
DROP TABLE DEPARTMENT;
SELECT * FROM department;

DELIMITER $$
CREATE TRIGGER delete_trigger_depart
BEFORE DELETE 
ON department FOR EACH ROW
BEGIN
	UPDATE employee SET d_id=NULL WHERE d_id=OLD.d_id;
END$$
DELIMITER ;

DELETE FROM department WHERE d_id="D3";

SHOW TABLES;
SELECT * FROM employee;
-- Procedure practice
SELECT * FROM courses where Coursename="Algebra";
DELIMITER $$
CREATE PROCEDURE getcoursename(IN cname VARCHAR(10))
BEGIN
    SELECT * FROM courses where courses.coursename=cname;
END$$
DELIMITER ;
CALL getcoursename("biology");
DROP PROCEDURE getcoursename;

DELIMITER $$
CREATE PROCEDURE getsalary(IN name VARCHAR(10),OUT e_Salary INT)
BEGIN
    SELECT salary INTO e_salary FROM employee WHERE employee.e_name=name;
END$$
DELIMITER ;
CALL getsalary("sneha",@e_salary);
SELECT @e_salary;
SELECT salary FROM employee WHERE e_name="sanika";







