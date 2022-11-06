DROP DATABASE IF EXISTS customerDB;
CREATE DATABASE customerDB;

USE customerDB;

CREATE TABLE customer(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
	customer_first_name varchar(50) NOT NULL,
	customer_last_name varchar(50) NOT NULL
);

CREATE TABLE customer_order(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
	customer_id int not null,
    FOREIGN KEY pk_customer_order_customer (customer_id)
        REFERENCES customer(customer_id),
	order_date date,
	order_total int not null
);

insert into customer(customer_first_name, customer_last_name) values
	('John', 'Micj'),('Abe', 'Jaheks'),('Cal', 'Lom'),('Rit', 'Kis');
select * from customer;
insert into customer_order(customer_id, order_date, order_total) values
	(1, '2022-09-15','1000'),(2, '2022-09-15', '1400'),(3, '2022-09-15', '500'),
    (4, '2022-09-15', '900');
select * from customer_order;
SELECT c.customer_id, c.customer_first_name, c.customer_last_name, 
AVG(co.order_total) average_order_total FROM customer c JOIN customer_order co ON c.customer_id = co.order_id 
GROUP BY c.customer_id HAVING AVG(co.order_total) >= 1000 ORDER BY AVG(co.order_total) DESC;


SELECT c.customer_id, c.customer_first_name, c.customer_last_name, 
AVG(co.order_total) average_order_total FROM customer c JOIN customer_order co ON c.customer_id = co.customer_id 
GROUP BY c.customer_id HAVING AVG(co.order_total) >= 1000 ORDER BY AVG(co.order_total) DESC;


SELECT c.customer_first_name, c.customer_last_name, SUM(co.order_total) AS total_to_date FROM customer c JOIN customer_order co ON c.customer_id = co.customer_id GROUP BY c.customer_id ORDER BY SUM(co.order_total) DESC LIMIT 10;

SELECT c.customer_first_name, c.customer_last_name, SUM(co.order_total) AS total_to_date FROM customer c JOIN customer_order co ON c.customer_id = co.customer_id ORDER BY SUM(co.order_total) DESC LIMIT 10;


SELECT c.customer_id, c.customer_first_name, c.customer_last_name FROM customer c LEFT OUTER JOIN customer_order co ON c.customer_id = co.customer_id WHERE co.order_id IS NULL;


SELECT c.customer_id, c.customer_first_name, c.customer_last_name FROM customer c RIGHT OUTER JOIN customer_order co ON c.customer_id = co.customer_id WHERE co.order_id IS NULL;


SELECT c.customer_id, c.customer_first_name, c.customer_last_name FROM customer c JOIN customer_order co ON c.customer_id = co.customer_id WHERE co.order_id IS NULL;


SELECT customer_id, COUNT(*) order_count, 
    AVG(order_total) average_order_total 
FROM customer c 
JOIN customer_order co ON c.customer_id = co.customer_id 
GROUP BY customer_id;