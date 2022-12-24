CREATE DATABASE if not exists restaurantdb;
USE restaurantdb;

## ==============================
## 		Create Dataset
## ==============================

CREATE TABLE zip
(
zip_code CHAR(7),
city VARCHAR(15),
state VARCHAR(15),
PRIMARY KEY(zip_code)
);

CREATE TABLE if not exists employee
(
emp_id INT NOT NULL AUTO_INCREMENT,
fname VARCHAR(20),
lname VARCHAR(20),
title CHAR(15),
street VARCHAR(30),
zip_code CHAR(7),
salary FLOAT,
start_date DATE,
end_date DATE,
PRIMARY KEY(emp_id),
FOREIGN KEY(zip_code) REFERENCES zip (zip_code)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE customer
(
customer_id INT NOT NULL AUTO_INCREMENT,
customer_fname VARCHAR(15),
customer_lname VARCHAR(15),
customer_phone CHAR(10),
PRIMARY KEY(customer_id)
);


CREATE TABLE orders
(
order_id INT NOT NULL AUTO_INCREMENT,
emp_id INT,
customer_id INT,
order_date DATE,
PRIMARY KEY(order_id),
FOREIGN KEY(emp_id) REFERENCES employee (emp_id)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
FOREIGN KEY(customer_id) REFERENCES customer (customer_id)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE menu_item
(
item_id INT NOT NULL AUTO_INCREMENT,
item_name VARCHAR(5),
item_price FLOAT,
inventory CHAR(4),
item_type CHAR(5),
PRIMARY KEY(item_id)
);

CREATE TABLE order_details
(
order_details_id INT NOT NULL AUTO_INCREMENT,
order_id INT,
item_id INT,
quantity CHAR(3),
PRIMARY KEY(order_details_id, order_id),
FOREIGN KEY(order_id) REFERENCES orders (order_id)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
FOREIGN KEY(item_id) REFERENCES menu_item (item_id)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);


CREATE TABLE food_item
(
item_id INT,
calories SMALLINT,
gluten_free BOOLEAN, 
vegan BOOLEAN,
PRIMARY KEY(item_id),
FOREIGN KEY(item_id) REFERENCES menu_item (item_id)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE drink_item
(
item_id INT,
alcoholic BOOLEAN, 
PRIMARY KEY(item_id),
FOREIGN KEY(item_id) REFERENCES menu_item (item_id)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE reservation
(
reservation_id INT NOT NULL AUTO_INCREMENT,
customer_id INT,
reservation_date DATE,
PRIMARY KEY(reservation_id),
FOREIGN KEY(customer_id) REFERENCES customer (customer_id)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);

## ==============================
## 		Populate Tables
## ==============================

INSERT INTO zip 
VALUES 
("93405", "San Luis Obispo", "California"),
("93446", "Paso Robles", "California");

INSERT INTO employee
VALUES
    ("Daniel", "Solomon", "waiter", "dover", "93405", 45000, "2016-02-01", NULL),
    ("Ryan", "John", "manager", "jeffrey", "93405", 80000, "2014-02-01", NULL),
    ("Shane", "Taylor", "waiter", "Frogley", "93405", 40000, "2019-02-01", NULL),
    ("Amanda", "Caitlin", "manager", "Lemon",  "93405", 60000, "2018-02-01", NULL),
    ("Kyle", "Hoff", "waiter", "acute",  "93405", 56000, "2018-02-01", "2019-03-05"),
    ("Phil", "Hoffman", "waiter", "Simmons", "93405", 51000, "2018-04-09", "2019-09-01"),
    ("Tim", "Phillips", "waiter", "Foothill",  "93405", 49000, "2015-05-02", "2020-01-05"),
    ("Ashley", "Timmons", "waiter", "California", "93405", 52000, "2015-01-06", NULL),
    ("Alex", "Evans", "waiter", "Ticket",  "93405", 45000, "2019-08-01", "2019-11-05"),
    ("Mary", "Sano", "waiter", "Pasture", "93405", 44000, "2016-02-01", "2019-03-08"),
    ("Mark", "Hastings", "waiter", "acute", "93405", 53000, "2018-02-04", NULL),
    ("Jerry", "Polanco", "waiter", "los osos", "93405", 50000, "2015-02-01", NULL),
    ("Steve", "Jobs", "waiter", "Hillman", "93405", 53000, "2017-03-01", "2019-08-04"),
    ("Mati", "Kepler", "waiter", "Santa Rosa", "93405", 45000, "2020-01-04", NULL),
    ("Chris", "Masters", "waiter", "gilbert",  "93405", 41000, "2019-02-01", "2020-03-07"),
    ("John", "Bennett", "waiter", "carlton",  "93405", 50000, "2015-04-04", "2019-09-21"),
    ("Blake", "Cooper", "waiter", "Orange",  "93405", 51000, "2018-04-022", "2019-05-22"),
    ("Olivia", "Ludden", "waiter", "Winderemere", "93405", 53000, "2015-02-27", "2017-03-16"),
    ("Will", "Ferguson", "waiter", "shelby", "93405", 41000, "2019-12-03", "2020-07-03"),
    ("Will", "Merriman", "dish washer", "Sand Point", "93446", 45000, "2014-08-12", NULL);
        
INSERT INTO customer 
VALUES 
(NULL, "Tim", "Salmon", "4539221348"),
    (NULL, "Angela", "Trout", "8056432358"),
    (NULL, "Mike", "Scott", "3045443218"),
    (NULL, "Ann", "Taylor", "8059843651"),
    (NULL, "Scott", "Hanson", "2069229653"),
    (NULL, "Tim", "Roberts", "8053316519"),
    (NULL, "Roger", "Butkus", "4251916531"),
    (NULL, "Lily", "Roberts", "3431219482"),
    (NULL, "Selena", "Hayek", "3873239853"),
    (NULL, "Mike", "Haniger", "8053439845");


INSERT INTO orders
VALUES
(NULL, 1, 1, "2020-01-16"),
    (NULL, 3, 2, "2020-01-18"),
    (NULL, 1, 3, "2020-01-19"),
    (NULL, 3, 4, "2020-01-19"),
    (NULL, 3, 1, "2020-01-20"),
    (NULL, 11, 5, "2020-01-20"),
    (NULL, 12, 1, "2020-01-20"),
    (NULL, 3, 6, "2020-01-20"),
    (NULL, 1, 7, "2020-01-20"),
    (NULL, 11, 5, "2020-01-21"),
    (NULL, 11, 8, "2020-01-21"),
    (NULL, 12, 9, "2020-01-21");

INSERT INTO menu_item
VALUES    
(NULL, "Burger", 7.50, 134, "food"),
    (NULL, "Vegan Burger", 8.50, 89, "food"),
    (NULL, "Chicken Burger", 9.00, 177, "food"),
    (NULL, "Fries", 4.50, 402, "food"),
    (NULL, "Burrito", 9.00, 129, "food"),
    (NULL, "Veggie Burrito", 8.00, 185, "food"),
    (NULL, "Coke", 2.50, 134, "drink"),
    (NULL, "Sprite", 2.50, 128, "drink"),
    (NULL, "Dr. Pepper", 2.50, 150, "drink"),
    (NULL, "Beer", 5, 90, "drink"),
    (NULL, "Wine", 7, 48, "drink"),
    (NULL, "Alcoholic Seltzer", 5, 180, "drink");

INSERT INTO food_item
VALUES
(1, 700, FALSE, FALSE),
(2, 450, FALSE, FALSE),
    (3, 850, FALSE, FALSE),
    (4, 550, FALSE, TRUE),
    (5, 900, FALSE, FALSE),
    (6, 400, FALSE, TRUE);
    
INSERT INTO drink_item
VALUES
	(7, FALSE),
    (8, FALSE),
	(9, FALSE),
    (10, TRUE),
    (11, TRUE),
    (12, TRUE);

INSERT INTO reservation
VALUES
(NULL, 1, "2020-01-16"),
    (NULL, 2, "2020-01-18"),
    (NULL, 3, "2020-01-18"),
    (NULL, 4, "2020-01-19"),
    (NULL, 5, "2020-01-19"),
    (NULL, 5, "2020-01-20"),
    (NULL, 6, "2020-01-20"),
    (NULL, 1, "2020-01-21"),
    (NULL, 8, "2020-01-22"),
    (NULL, 9, "2020-01-23");

INSERT INTO order_details
VALUES
(NULL, 1, 2, 1),
    (NULL, 1, 7, 1),
    (NULL, 2, 3, 2),
    (NULL, 2, 9, 1),
    (NULL, 3, 3, 1),
    (NULL, 4, 5, 2),
    (NULL, 5, 7, 1),
    (NULL, 5, 1, 1),
    (NULL, 6, 3, 1),
    (NULL, 6, 10, 1),
    (NULL, 7, 1, 1),
    (NULL, 8, 8, 3),
    (NULL, 9, 2, 2),
    (NULL, 10, 2, 1),
    (NULL, 10, 10, 1);
    
    
## ==============================
## 		Database Testing
## ==============================

#Find employees with average salary > 45000
SELECT emp_id, fname AS "First_Name", lname AS "Last_Name", AVG(salary) AS "Avg Salary"
FROM employee
GROUP BY emp_id
HAVING AVG(salary) >= 45000
ORDER BY AVG(salary) DESC;


#Find the most profitable item on the menu
SELECT m.item_id, m.item_name, SUM(m.item_price * od.quantity) As total_sold
FROM menu_item m JOIN order_details od
GROUP BY m.item_id
ORDER BY total_sold DESC;

#Find the customers who spend the most amount of money
SELECT c.customer_fname, c.customer_lname, sum(mi.item_price*od.quantity) AS "total_spend"
FROM customer c JOIN menu_item mi JOIN order_details od JOIN orders o
ON od.order_id = o.order_id
AND o.customer_id = c.customer_id
AND od.item_id = mi.item_id
GROUP BY c.customer_fname, c.customer_lname
ORDER BY total_spend DESC;

#Display the information of customers who have never placed reseravations 
SELECT c.customer_fname, c.customer_lname, sum(mi.item_price*od.quantity) AS "total_spend"
FROM customer c JOIN menu_item mi JOIN order_details od JOIN orders o
ON od.order_id = o.order_id
AND o.customer_id = c.customer_id
AND od.item_id = mi.item_id
WHERE c.customer_id NOT IN
(
SELECT customer_id
FROM reservation
)
GROUP BY c.customer_fname, c.customer_lname
ORDER BY total_spend DESC;




