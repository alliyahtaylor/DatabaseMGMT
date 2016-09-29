--Lab 4
--Alliyah Taylor
--9/29/2016

--Cities of agents booking an order for a customer whose cid is 'c006'
	--cities of agents
	SELECT city
	FROM agents
	WHERE aid IN(
			--agents booking order for customer whose cid is 'c006'
				SELECT aid
				FROM orders
				WHERE cid = 'c006');

--ids of products ordered through any agent who takes at least one order from a customer in kyoto, sorted by pid from highest to lowest.
	--product ids
	SELECT pid
	FROM Orders
	WHERE aid in(
			--agent who takes orders
				SELECT aid
				FROM Orders
				WHERE cid IN(
						--Customer in Kyoto
							SELECT cid
							FROM customers
							WHERE city = 'Kyoto'))
	ORDER BY pid DESC;

--Get the ids and names of customers who did NOT place an order through agent a03
	SELECT cid, name
	FROM Customers
	WHERE cid NOT IN(
				--Customers who DID place an order through a03
					SELECT cid
					FROM Orders
					WHERE aid = 'a03');
--Get the ids of customers who ordered both product p01 and p07
	--customers who ordered p01 and p07
	SELECT DISTINCT cid
	FROM Orders
	WHERE pid= 'p01' 
	AND cid IN(
			--customers who ordered p07
				SELECT cid
				FROM Orders
				WHERE pid = 'p07');

-- Get the ids of products NOT ordered by any customers who placed any order through agent a08 in pid order from highest to lowest
	SELECT DISTINCT pid
	FROM Products
	WHERE pid NOT IN(
					--products ordered from a08
					SELECT pid
					FROM Orders
					WHERE aid = 'a08')
	ORDER BY pid DESC;

-- Get the name, discounts, and city for all customers who place orders through agents in Dallas or New York
	--Get name, discount, cities
	SELECT name, discount, city
	FROM Customers
	WHERE cid IN(
				--customers who place orders
				SELECT cid
				FROM Orders
				WHERE aid in(
							--Agents in Dallas or New York
							SELECT aid
							FROM Agents
							WHERE city = 'Dallas'
							OR city = 'New York'));

-- Get all customers who have the same discount as that of any customers in Dallas or London
	SELECT cid, name
	FROM Customers
	WHERE discount IN(
			SELECT discount
			FROM customers
			WHERE city = 'Dallas'
			OR city = 'London');
/* #8.
		Check constraints are limits put on the value ranges for columns in a table. These constraints are good for data integrity, as they only allow certain data values to be inserted in a given column. A good example of a constraint is making the age of public school students limited to the numbers 4 through 21 in a school district where kindergarten starts at age 4 and students age out of the school system at 21. Anyone younger than 4 or older than 21 cannot go to school in the district, so any other numbers are either typos or invalid entries.
		A bad example of a constraint would be if a business gave numbered IDs to their customers and limited these numbers to integers up to 100. This would only work if the business did not grow or gain new customers. In the good example, limiting the potential values helps prevent mistakes in the data. In the bad example, the constraint is too short-sighted and does not account for future growth. 