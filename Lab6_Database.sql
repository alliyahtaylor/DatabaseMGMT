--Alliyah Taylor
--Lab 6
--10/12/2016

-- Name and city of customers who live in ANY city that makes the MOST different kinds of products
	SELECT name, city
	FROM customers
	WHERE city in(
	-- Two cities that make the most different kinds of products. 
					SELECT city
					FROM products
					GROUP BY city
					ORDER BY count(city) DESC
					LIMIT 2
				  );
--Names of products whose priceUSD is strictly below the average priceUSD in reverse-alphabetical order
	SELECT name
	FROM products
	WHERE priceUSD < (
					SELECT AVG(priceUSD)
					FROM products
					 )
	ORDER BY name DESC;
--Customer name, pid ordered, and total for all orders sorted by total from low to high
	SELECT customers.name, orders.pid, orders.totalUSD
	FROM customers, orders
	WHERE customers.cid = orders.cid
	ORDER BY orders.totalUSD ASC;
--all customer names in alphabetical order and total ordered, nothing more. 
	SELECT customers.name, COALESCE(SUM(orders.qty), 0.00)
	FROM customers, orders
	WHERE customers.cid = orders.cid
	GROUP BY customers.cid
	ORDER BY customers.name ASC ;
--all customers who bought products from agents based in NY and names of prods ordered AND names of agents who sold to them
	SELECT c.name, p.name, a.name
	FROM orders o FULL OUTER JOIN customers c on o.cid = c.cid
				  FULL OUTER JOIN products p on o.pid = p.pid
				  FULL OUTER JOIN agents a on o.aid = a.aid
	WHERE a.city = 'New York' ;

--check accuracy of dollars column in orders table.
	SELECT o.ordnum,o.totalUSD, (p.priceUSD * o.qty) * (1- c.discount/100)
	FROM orders o LEFT OUTER JOIN customers c on o.cid = c.cid
				  LEFT OUTER JOIN products p on o.pid = p.pid
	WHERE totalUSD != (p.priceUSD * o.qty) * (1- c.discount/100)
	GROUP BY ordnum, c.cid, p.pid ;
--What's the difference between LEFT OUTER JOIN and a RIGHT OUTER JOIN?
/*
LEFT OUTER JOIN looks at the left table first to match data with the table on the right, while RIGHT OUTER JOIN looks at the table on the right first.
*/
-- This RIGHT OUTER JOIN gives all the customers on the order table and any that match from the customers table 
SELECT c.name
FROM customers c RIGHT OUTER JOIN orders o ON c.cid = o.cid ;
-- This LEFT OUTER JOIN gives all the customers on the customers table, and any that also appear on the orders table, so even customers who have not placed any orders will appear.
SELECT c.name
FROM customers c LEFT OUTER JOIN orders o ON c.cid = o.cid ;
