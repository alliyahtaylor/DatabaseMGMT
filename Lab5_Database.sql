--Alliyah Taylor
--Lab 5
--10/5/2016

--1. Show the cities of agents booking an order for a customer whose id is 'c006'. Use joins; no subqueries.
	SELECT city
	FROM agents a INNER JOIN orders o ON a.aid=o.aid
	WHERE o.cid = 'c006' ;
--2. Show the ids of products ordered through any agent who makes AT LEAST one order for a customer in Kyoto, sort by pid DESC. Joins; no subqueries.
	SELECT DISTINCT o2.pid
		FROM orders o INNER JOIN customers c ON o.cid = c.cid
					  INNER JOIN agents a ON c.city = 'Kyoto'
					  --Thanks to stack exchange for the inner join of same table.--
					  INNER JOIN orders o2 ON o2.aid = o.aid
		

--3. Show the names of customers who have never placed an order. Use a subquery.
	SELECT name
	FROM Customers
	WHERE cid NOT IN(
						SELECT cid
						FROM Orders)
--4. Show the names of customers who have never placed an order. Use an outer join.
	SELECT name
	FROM customers c LEFT OUTER JOIN orders o ON c.cid=o.cid
	WHERE o.cid IS NULL
--5. Show the names of customers who placed at least one order through an agent in their own city, along with those agent(s') names.
	SELECT DISTINCT c.name, a.name
	FROM orders o INNER JOIN customers c ON o.cid = c.cid
				  INNER JOIN agents a ON o.aid = a.aid
	WHERE a.city = c.city
--6. Show the names of customers and agents living in the same city, along with the name of the shared city, regardless of whether or not the customer has ever placed an order with the agent.
	SELECT c.name, a.name, c.city
	FROM customers c INNER JOIN agents a ON c.city = a.city;
--7. Show the name and city of customers who live in THE city that makes the FEWEST different kinds of products. (Use count and group by on the Products table)
--This query made me want to set myself on fire.
	SELECT name, city
	FROM customers
	WHERE city in(
					SELECT city
					FROM products 
					GROUP BY city
					ORDER BY count(pid)
					LIMIT 1);