CREATE DATABASE looppractice;
USE looppractice;

-- SIMPLE LOOP SYNTAX
/* label_name: LOOP
IF condition THEN
   LEAVE label_name;
END IF;
END LOOP label_name; */

-- print 1 to 10
DELIMITER $$
CREATE PROCEDURE loopexamp1()
BEGIN
    DECLARE i INT;
    SET i=1;
    
    print1to10: LOOP
    IF i=10 THEN 
       LEAVE print1to10;
	END IF;
    SELECT i;
    SET i=i+1;
END LOOP print1to10;
END$$
DELIMITER ;
DROP PROCEDURE loopexamp1;
CALL loopexamp1();

-- WHILE LOOP SYNTAX
/* label_name : WHILE
   condition DO
   //statements
END WHILE label_name;*/

DELIMITER $$
CREATE PROCEDURE whileloopex1()
BEGIN
     DECLARE i INT;
     SET i=1;
     
     print1to10: WHILE
        i<=10 DO
           SELECT i;
           SET i=i+1;
	END WHILE print1to10;

END$$
DELIMITER ;
DROP PROCEDURE whileloopex1;
CALL  whileloopex1();


DELIMITER $$
CREATE PROCEDURE loopexample2()
BEGIN
    DECLARE i INT;
    SET i=2;
     
     print2table: LOOP
     IF i=20 THEN 
        LEAVE print2table;
	END IF;
       SELECT i;
       SET i=i+2;
END LOOP print2table;
END $$
DELIMITER ;
CALL loopexample2();
DROP PROCEDURE loopexample2;

DELIMITER $$
CREATE PROCEDURE whileloopex2()
BEGIN
    DECLARE i INT;
    SET i=2;
   
    print2table: WHILE
    i<=20 DO
    IF i%2=0 THEN 
      SELECT i;
	END IF;
      SET i=i+2;
    END WHILE print2table;
END$$
DELIMITER ;
CALL whileloopex2();


CREATE TABLE student(
s_id VARCHAR(10)
);

DELIMITER $$
CREATE PROCEDURE loopexample3()
BEGIN
    DECLARE i INT;
    SET i=1;
    
    addvalue: LOOP
    IF i=6 THEN 
       LEAVE addvalue;
	END IF;
       INSERT INTO student VALUE (concat("emp",i));
       SET i=i+1;
END LOOP addvalue;
END $$;
DELIMITER ;
CALL loopexample3();
DROP PROCEDURE loopexample3;
SELECT * FROM STUDENT;
DESC STUDENT;

