# Food Delivery Database System

## Project Overview
A comprehensive relational database system designed for a food delivery service using PostgreSQL. This project manages the entire operational workflow, including customers, orders, riders, menu items, and reviews.

## Database Schema Design
The schema consists of 9 normalized tables to ensure data integrity and eliminate redundancy.

## Key Features
- **Customer & Order Management:** Track customer information and order history.
- **Rider Performance Analysis:** Monitor rider availability and delivery performance.
- **Menu & Sales Analytics:** Analyze revenue by category and popular items.
- **Review System:** Collect and analyze customer feedback for orders and riders.

## SQL Queries & Business Insights

### 1. Top-Spending Customers
**Business Question:** Who are our most valuable customers?
**SQL Skill:** `JOIN`, `GROUP BY`, `SUM`, `ORDER BY`, `LIMIT`
```sql
SELECT c.first_name, c.last_name, SUM(o.order_total) as total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 3;
```
**Insight:** This analysis reveals the  customers for loyalty rewards and personalized marketing allowing the company to send them more offers and opportunities that they become our vip customers 

### 2.Revenue by Menu Category
**Business Question:** Which menu category is the most profitable for us
**SQL Skill:** `SELECT`,`AS`,`FROM`,`INNER JOIN`,`ON`,`GROUP BY`,`ORDER BY`,`DESC`
```sql
SELECT m.item_category, SUM(oi.line_total) AS total_revenue
FROM menu_items m
INNER JOIN order_items oi ON m.item_id = oi.item_id
GROUP BY m.item_category
ORDER BY total_revenue DESC;
```
**Insight:** This analysis reveals the highest-grossing menu categories, allowing management to make data-driven decisions on where to focus marketing efforts, optimize ingredient sourcing, and potentially develop new menu items to maximize profitability.

## How to Use
1.  Run the `schema_definition.sql` script in PostgreSQL to create the tables.
2.  Run the `data_insertion.sql` script to populate the database with sample data.
3.  Execute the queries in `sql_queries.sql` to reproduce the analysis.

## Technologies Used
- PostgreSQL
- SQL
- pgAdmin

---
*This project was completed as part of my Data Science Mastery Program.*