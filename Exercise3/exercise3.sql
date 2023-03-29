USE `classicmodels`;
SELECT customers.customerName, COUNT(*) as OrderCount
FROM orders 
JOIN customers ON orders.customerNumber = customers.customerNumber
GROUP BY customers.customerName
HAVING COUNT(*) = (
  SELECT MAX(orderCount)
  FROM (
    SELECT COUNT(*) as orderCount
    FROM orders
    GROUP BY customerNumber
  ) AS counts
);


SELECT customers.customerName, orderdetails.*
FROM customers
INNER JOIN orders ON customers.customerNumber = orders.customerNumber
INNER JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
WHERE customers.country = 'Germany'
ORDER BY customers.customerName;


SELECT employees.employeeNumber, employees.lastName, employees.firstName, SUM(payments.amount) as revenue
FROM employees
JOIN customers ON employees.employeeNumber = customers.salesRepEmployeeNumber
JOIN payments ON customers.customerNumber = payments.customerNumber
GROUP BY employees.employeeNumber
ORDER BY revenue DESC;


SELECT products.productName
FROM products
INNER JOIN orderdetails ON products.productCode = orderdetails.productCode
INNER JOIN orders ON orderdetails.orderNumber = orders.orderNumber
WHERE orders.orderDate BETWEEN '2004-12-01' AND '2004-12-31'
GROUP BY products.productName;


CREATE TABLE employeedetails (
  employeeNumber INT NOT NULL,
  bankAccount VARCHAR(50),
  address VARCHAR(100),
  phoneNumber VARCHAR(20),
  personalEmail VARCHAR(50),
  PRIMARY KEY (employeeNumber),
  FOREIGN KEY (employeeNumber) REFERENCES employees (employeeNumber)
);







