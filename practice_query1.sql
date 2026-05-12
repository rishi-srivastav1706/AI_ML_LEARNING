CREATE DATABASE College;

 USE college;
 
 CREATE TABLE Teacher (
   id INT PRIMARY KEY,
   name VARCHAR(30) NOT NULL,
   subject VARCHAR(15) NOT NULL,
   salary INT DEFAULT 0
);

INSERT INTO Teacher
(id, name , subject, salary)
VALUES
(23,"ajay","math",50000),
(47,"bharat", "english", 60000),
(18, "chetan", "chemistry", 45000),
(9,"divya", "physics" ,75000);

SELECT * FROM Teacher
WHERE salary >55000;


ALTER TABLE Teacher
CHANGE COLUMN salary ctc INT DEFAULT 0;


UPDATE Teacher
SET ctc = ctc+(0.25)*ctc
WHERE ctc>=45000;

ALTER TABLE Teacher
ADD COLUMN city VARCHAR(50) DEFAULT "Gurgoan";

ALTER TABLE Teacher
DROP COLUMN ctc;

SELECT * FROM  Teacher;
 
