--1. Combine the menu_items and order_details tables into a single table
SELECT * FROM menu_items;
SELECT * FROM order_details;


SELECT * FROM order_details od
LEFT JOIN menu_items mi
ON mi.menu_item_id  = od.item_id;

-- 2. What were the least and most ordered items? What categories were they in?
SELECT item_name,category, COUNT(order_details_id) AS number_of_purchases
FROM order_details od
INNER JOIN menu_items mi
ON mi.menu_item_id  = od.item_id
GROUP BY item_name, category
ORDER BY number_of_purchases DESC
lIMIT 10;



SELECT item_name,category, COUNT(order_details_id) AS number_of_purchases
FROM order_details od
INNER JOIN menu_items mi
ON mi.menu_item_id  = od.item_id
GROUP BY item_name, category
ORDER BY number_of_purchases
lIMIT 10;


--3. What were the top 5 orders that spent the most money?

SELECT od.order_id,
       COALESCE(SUM(mi.price), 0) AS total_spend
FROM order_details od
LEFT JOIN menu_items mi
  ON mi.menu_item_id = od.item_id
GROUP BY od.order_id
ORDER BY total_spend DESC
LIMIT 5;


--4. View the details of the highest spend order. Which specific items were purchased?

SELECT category, COUNT(item_id) AS num_items
FROM order_details od
LEFT JOIN menu_items mi
  ON mi.menu_item_id = od.item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY category
ORDER BY num_items DESC;



--5.  View the details of the top 5 highest spend orders

SELECT order_id, category, COUNT(item_id) AS num_items
FROM order_details od
LEFT JOIN menu_items mi
  ON mi.menu_item_id = od.item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY category, order_id
ORDER BY num_items DESC
LIMIT 10;