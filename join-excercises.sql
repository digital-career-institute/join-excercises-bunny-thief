-- Join excercises

-- 1. Select all product names for suppliers from USA.
	SELECT p.product_name FROM products as p
	INNER JOIN suppliers as s ON p.supplier_id = s.supplier_id
	WHERE s.country = 'USA';

-- 2. Select order id, order date, employee first and last name for employee
-- whose last name starts with 'D' and for order that was shipped to Germany.
	SELECT o.order_id, o.order_date, e.first_name, e.last_name FROM orders as o
	INNER JOIN employees as e on o.employee_id = e.employee_id
	WHERE e.last_name LIKE 'D%' AND o.ship_country = 'Germany';
	
-- 3. Select all orders shipped by United Package for orders sooner than '1996-08-12'
	SELECT o.order_id, o.customer_id, s.company_name, o.order_date FROM orders as o
	INNER JOIN shippers as s on o.ship_via = s.shipper_id
	WHERE s.company_name = 'United Package' and o.order_date < '1996-08-12';
    
-- 4. Select shippers company name that doesn't have any orders assigned.
	SELECT s.company_name FROM shippers as s
	LEFT JOIN orders as o on s.shipper_id = o.ship_via
	WHERE o.order_id is null;
	
-- 5. Select order ids that contains product from category 'Beverages' ordered '1996-08-14'.
	SELECT o.order_id, c.category_name, o.order_date FROM orders as o
	INNER JOIN order_details as od ON o.order_id = od.order_id
	INNER JOIN products AS p ON od.product_id = p.product_id
	INNER JOIN categories AS c ON p.category_id = c.category_id
	WHERE c.category_name = 'Beverages' AND o.order_date = '1996-08-14';
	
-- 6. Select product names and availability of products supplied by 'Lyngbysild' from category 'Seafood'
	SELECT p.product_name, p.units_in_stock FROM products as p
	INNER JOIN categories AS c ON p.category_id = c.category_id
	INNER JOIN suppliers AS s ON p.supplier_id = s.supplier_id
	WHERE c.category_name = 'Seafood' AND s.company_name = 'Lyngbysild';
	
-- 7. Select last names of employees assigned to 'Northern' region.
	SELECT DISTINCT e.last_name FROM employees AS e
	JOIN employee_territories AS et ON e.employee_id = et.employee_id
	JOIN territories as t ON et.territory_id = t.territory_id
	JOIN region AS r ON t.region_id = r.region_id
	WHERE r.region_description = 'Northern';
	
-- 8. Select employee id and his boss last name for those who have orders with date later than '1996-07-18'. if an employee doesn't have a boss don't include him.

-- 9. List the employees in the warehouse with orders that are not shipped yet.
	SELECT DISTINCT e.last_name FROM employees AS e
	RIGHT OUTER JOIN orders as o ON e.employee_id = o.employee_id
	WHERE o.shipped_date is null;

-- 10. Calculate the price for each product with its name in each order after discount is applied.