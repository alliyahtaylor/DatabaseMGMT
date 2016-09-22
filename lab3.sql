/* Code by Alliyah Taylor
	9/21/2016
	For Lab 3 */
	
--Lists the order number and total dollars of all orders
SELECT ordno, totalUSD
FROM Orders;

--Lists the name and city of agents named Smith
SELECT name, city
FROM Agents
WHERE Name = 'Smith';

--Lists the id, name, and priceUSD of products with quantity more than 201,000.
SELECT pid, name, priceUSD
FROM Products
WHERE quantity > 201000;

--Lists the names and cities of customers in Duluth
SELECT name, city
FROM Customers
WHERE city = 'Duluth';

--Lists the names of agents not in New York and not in Duluth
SELECT names
FROM Agents
WHERE city != 'New York' 
AND city != 'Duluth';

--List all data for products in neither Dallas nor Duluth that cost US$1 or more
SELECT *
FROM Products
WHERE city != 'Dallas'
AND city != 'Duluth'
AND priceUSD >= 1;

--Lists all data for orders in February or March
Select *
FROM Orders
WHERE mon = 'feb'
OR mon = 'mar';

--Lists all data for orders in February of US$600 or more
SELECT *
FROM Orders
WHERE mon = 'feb'
AND totalUSD > 600;

--Lists all orders from the customer whose cid is C005
SELECT *
FROM Orders
WHERE cid ='c005';