CREATE  DATABASE college;

CREATE DATABASE IF NOT EXISTS instagram;

USE instagram;

CREATE TABLE user (
  id INT,
  age INT,
  name VARCHAR(30)  NOT NULL,
  email VARCHAR(50) UNIQUE,
  followers INT DEFAULT 0,
  following INT,
  CONSTRAINT  CHECK (age>=13),
  PRIMARY KEY(id)
);

INSERT INTO user
(id,age, name, email, followers, following)
VALUES
(1,14,"adam","adam@gmail.com",123,145),
(2,15,"bob", "bob@gmail.com", 200, 200),
(3, 16, "casey", "casey@gmail.com", 300,306),
(4, 17, "donald", "donald@gmail.com", 200,105);

INSERT INTO user
(id,name, email, following)
VALUES
(6,  "ridhi", "ridhi@gmail.com",  306);

INSERT INTO user
(id,name, email, following)
VALUES
(5, "rishi", "rishi@gmail.com", 145);



SELECT name, followers
FROM user
WHERE followers >= 200;

SELECT name ,age, email
FROM user
WHERE age>14
LIMIT 2;

SELECT name ,age, followers
FROM user
ORDER BY followers asc;


SELECT max(followers)
FROM user;

SELECT followers, count(id)
FROM user 
GROUP BY followers;

SELECT age, max(followers)
FROM user
GROUP BY age
HAVING max(followers>200);


SELECT age, max(followers)
FROM user
GROUP BY age
HAVING max(followers>200)
ORDER BY age DESC;

UPDATE user 
SET followers = 600
WHERE age = 16;



ALTER TABLE user 
ADD COLUMN city VARCHAR(20) DEFAULT "delhi";

ALTER TABLE user
DROP COLUMN age;

ALTER TABLE user
RENAME TO insta_user;

ALTER TABLE insta_user
RENAME TO user;

ALTER TABLE user
 CHANGE COLUMN followers subs int DEFAULT 0;

ALTER TABLE user
MODIFY subs int DEFAULT 5;

TRUNCATE TABLE user;

SELECT * FROM user;
SET SQL_SAFE_UPDATES =0;

DROP TABLE post;
CREATE TABLE post (
  id INT PRIMARY KEY,
  content VARCHAR(100),
  user_id INT,
  FOREIGN KEY (user_id) REFERENCES user(id)
);

