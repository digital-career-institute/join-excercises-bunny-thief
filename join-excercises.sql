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

-- 5. Select order ids that contains product from category 'Beverages' ordered '1996-08-14'.

-- 6. Select product names and availability of products supplied by 'Lyngbysild' from category 'Seafood'

-- 7. Select last names of employees assigned to 'Northern' region.

-- 8. Select employee id and his boss last name for those who have orders with date later than '1996-07-18'. if an employee doesn't have a boss don't include him.

-- 9. List the employees in the warehouse with orders that are not shipped yet.

-- 10. Calculate the price for each product with its name in each order after discount is applied.