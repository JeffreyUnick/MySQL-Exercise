/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

SELECT p.name, c.name FROM products AS p
INNER JOIN categories AS c ON p.CategoryID = c.CategoryID
WHERE c.Name LIKE '%computer%';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */

 SELECT p.name, p.price, r.rating FROM products AS p
 LEFT JOIN reviews AS r ON p.productID = r.productID
 WHERE r.rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

SELECT e.Firstname, e.Lastname, Sum(s.quantity) AS quantity FROM employees AS e
INNER JOIN sales AS s ON e.employeeID = s.employeeID
GROUP BY e.employeeID
ORDER BY quantity DESC
LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */

SELECT d.name, c.name FROM categories AS c 
INNER JOIN departments AS d ON d.departmentID = c.departmentID
WHERE c.name = 'appliances' OR c.name = 'games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */

SELECT p.name, Sum(s.quantity) AS TotalQuantity, Sum(s.quantity * s.priceperunit) 
AS TotalPrice FROM products AS p
INNER JOIN sales AS s ON p.productID = s.productID
WHERE p.name LIKE '%Eagles: Hotel California%'
GROUP BY p.name;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

SELECT p.name, r.reviewer AS 'reviewer name', r.rating, r.comment FROM reviews AS r
INNER JOIN products AS p ON p.productID = r.productID
WHERE p.name LIKE '%visio tv%'
ORDER BY r.rating 
LIMIT 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

SELECT e.employeeID, e.firstname, e.lastname, p.name AS 'Product name', Sum(s.quantity) AS 'Qt Sold'
FROM employees AS e 
INNER JOIN  sales AS s ON s.employeeID = e.employeeID
INNER JOIN products AS p ON p.productID = s.productID
GROUP BY e.employeeID, p.productID
ORDER BY e.employeeID;
