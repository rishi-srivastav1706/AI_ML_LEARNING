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
 
CREATE TABLE  Student(
  roll_no INT PRIMARY KEY,
  name VARCHAR(50),
  city VARCHAR(50),
  marks INT
);

INSERT INTO Student
(roll_no, name, city, marks)
VALUES
(110, "adam", "delhi", 76),
(108,"bob","mumbai", 65),
(124, "casey", "pune", 94),
(112, "duke", "pune", 80);

SELECT * FROM Student
WHERE marks >75;

SELECT DISTINCT city
FROM Student;

SELECT max(marks)
FROM Student;

SELECT avg(marks)
FROM Student;

ALTER TABLE Student
ADD COLUMN grade VARCHAR(1);

UPDATE Student
SET grade = "O"
WHERE marks >=80;

UPDATE Student
SET grade = "A"
WHERE marks >=70 AND marks <80;

UPDATE Student
SET grade = "B"
WHERE marks >=60 AND marks <70;



SELECT * FROM Student





















