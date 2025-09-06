-- 1. Top-Spending Customers
SELECT c.first_name, c.last_name, SUM(o.order_total) as total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 3;

-- 2. Revenue by Menu Category
SELECT m.item_category, SUM(oi.line_total) AS total_revenue
FROM menu_items m
INNER JOIN order_items oi ON m.item_id = oi.item_id
GROUP BY m.item_category
ORDER BY total_revenue DESC;

-- 3. Most Popular Menu Item
SELECT m.item_name, SUM(oi.quantity) as total_times_ordered
FROM menu_items m
INNER JOIN order_items oi ON m.item_id = oi.item_id
GROUP BY m.item_name
ORDER BY total_times_ordered DESC
LIMIT 1;

-- 4. Rider Delivery Count
SELECT r.rider_name, COUNT(o.order_id) as total_deliveries
FROM orders o
INNER JOIN riders r ON o.rider_id = r.rider_id
GROUP BY r.rider_name
ORDER BY total_deliveries DESC;

-- 5. Average Rider Rating
SELECT r.rider_name, ROUND(AVG(rr.rating), 2) as average_rating
FROM riders r
INNER JOIN rider_reviews rr ON r.rider_id = rr.rider_id
GROUP BY r.rider_name
ORDER BY average_rating DESC;