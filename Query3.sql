CREATE DATABASE prime;
USE prime;

CREATE TABLE accounts(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    balance DECIMAL(10, 2)
);

INSERT INTO accounts(name, balance) VALUES
("Adam",500.00),
("bob",300.00),
("charlie",1000.00);

START TRANSACTION;

UPDATE accounts SET balance = balance - 50 WHERE id = 1;
UPDATE accounts SET balance = balance + 50 WHERE id = 2;

COMMIT;


START TRANSACTION;
UPDATE accounts SET balance = balance - 50 WHERE id = 1;
UPDATE accounts SET balance = balance + 50 WHERE id = 2;

ROLLBACK;

START TRANSACTION;
UPDATE accounts SET balance = balance - 50 WHERE id = 1;
SAVEPOINT after_wallet_topup;
UPDATE accounts SET balance = balance + 10 WHERE id = 1;
ROLLBACK TO after_wallet_topup;
COMMIT;

CREATE TABLE customers(
	customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);


INSERT INTO customers VALUES 
(1,"Alice", "Mumbai"),
(2,'Bob', "Delhi"),
(3, "Charlie","Bangalore"),
(4, "David", "Mumbai");


CREATE TABLE orderS(
	order_id INT PRIMARY KEY,
    customer_id INT, 
    amount INT
);


INSERT INTO orders VALUES
(101,1,500),
(102,1,900),
(103,2,300),
(104, 5, 700);




SELECT * FROM customers;
SELECT * FROM orders;

-- inner join
SELECT * FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;


SELECT * FROM customers c
LEFT join orders o
ON c.customer_id = o.customer_id;



SELECT * FROM customers c
RIGHT join orders o
ON c.customer_id = o.customer_id;

SELECT * FROM customers as c
LEFT join orders as o
ON c.customer_id = o.customer_id
UNION
SELECT * FROM customers as c
RIGHT join orders as o
ON c.customer_id = o.customer_id;


SELECT * FROM customers
CROSS JOIN orders;

SELECT * FROM customers as a
JOIN customers as b
ON A.customer_id = b.customer_id;


SELECT * 
FROM orders
WHERE amount> (
	SELECT AVG(amount)
    FROM orders
);


SELECT name , (
	SELECT COUNT(*)
    FROM orders o 
    WHERE o.customer_id = c.customer_id
)as order_count
FROM customers as c;


SELECT 
	summary.customer_id,
    summary.avg_amount
FROM 
	(
		SELECT
			customer_id,
            AVG(amount) AS avg_amount
		FROM orders
        GROUP BY customer_id
        
	)AS summary;
