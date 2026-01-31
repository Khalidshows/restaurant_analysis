USE restaurant_db;

-- What data is available in the menu_items table?
SELECT *
FROM menu_items;

-- How many menu items are there?
SELECT COUNT(*)
FROM menu_items;
-- Result: 32 menu items available.
-- Insight: Small, manageable menu size; suitable for exploratory analysis.

-- What are the most and least expensive menu items?
SELECT *
FROM menu_items
ORDER BY price DESC;

SELECT *
FROM menu_items
ORDER BY price ASC;
-- Observation: Most expensive item is Shrimp ($19.95), least expensive is Edamame ($5.00).
-- Insight: Price range suggests a mid-market menu rather than premium dining.

-- How many Italian dishes are on the menu?
SELECT COUNT(*)
FROM menu_items
WHERE category = 'italian';
-- Result: 9 Italian dishes.
-- Insight: Italian is one of the most represented categories.

-- What are the cheapest and most expensive Italian dishes?
SELECT * 
FROM menu_items
WHERE category = 'italian'
ORDER BY price ASC;
-- Observation: Italian prices range from $14.50 to $19.95.
-- Insight: Italian dishes sit toward the higher end of the menu pricing.

-- How many dishes are there in each category?
SELECT category, COUNT(*) AS dish_count
FROM menu_items
GROUP BY category;
-- Observation: Italian and American categories both contain 9 dishes.
-- Insight: Menu appears intentionally balanced across major categories.

-- What is the average price per category?
SELECT category, AVG(price) AS avg_price
FROM menu_items
GROUP BY category;
-- Insight: Comparing averages highlights relative positioning of categories by price.

-- What data is stored in the order_details table?
SELECT *
FROM order_details;

-- What is the date range of the order data?
SELECT 
    MAX(order_date) AS max_date, 
    MIN(order_date) AS min_date
FROM order_details;
-- Result: Orders range from 2023-01-01 to 2023-03-31.
-- Insight: Roughly three months of transactional data.

-- How many unique orders were placed in this date range?
SELECT COUNT(DISTINCT order_id)
FROM order_details
WHERE order_date BETWEEN '2023-01-01' AND '2023-03-31';
-- Result: 5,370 unique orders.
-- Insight: Sufficient volume for basic behavioural patterns, not long-term trends.

-- How many items are included in each order?
SELECT order_id, COUNT(*) AS num_items
FROM order_details
GROUP BY order_id
ORDER BY num_items DESC;
-- Insight: Distribution highlights typical order sizes and outliers.

-- Which orders contain more than 12 items?
SELECT order_id, COUNT(*) AS num_items
FROM order_details
GROUP BY order_id
HAVING num_items > 12;
-- Insight: Large orders may indicate group dining or events.

-- How many orders contain more than 12 items?
SELECT COUNT(*) 
FROM (
    SELECT order_id, COUNT(item_id) AS num_items
    FROM order_details
    GROUP BY order_id
    HAVING num_items > 12
) AS num_orders;
-- Insight: These represent a small subset of total orders.

-- How can menu items be linked to order details?
SELECT *
FROM menu_items AS m
LEFT JOIN order_details AS o
    ON m.menu_item_id = o.item_id;
-- Insight: Join enables analysis of revenue and popularity by item and category.

-- Which menu items are ordered most and least frequently?
WITH joined_table AS ( 
    SELECT *
    FROM menu_items AS m
    LEFT JOIN order_details AS o
        ON m.menu_item_id = o.item_id
)
SELECT 
    item_name,
    COUNT(item_name) AS num_orders
FROM joined_table
GROUP BY item_name
ORDER BY num_orders ASC;
-- Observation: Ordering frequency varies significantly by item.
-- Note: Results are exploratory and not adjusted for time or promotions.

-- Which orders have the highest total spend?
WITH joined_table AS ( 
    SELECT *
    FROM menu_items AS m
    LEFT JOIN order_details AS o
        ON m.menu_item_id = o.item_id
)
SELECT 
    order_id, 
    SUM(price) AS sum_price
FROM joined_table
GROUP BY order_id
ORDER BY sum_price DESC
LIMIT 5;
-- Observation: Order 440 has the highest total spend in the dataset.
-- Insight: High spend driven by volume rather than single high-priced items.

-- View the category breakdown of the highest spend order
WITH joined_table AS ( 
    SELECT *
    FROM menu_items AS m
    LEFT JOIN order_details AS o
        ON m.menu_item_id = o.item_id
)
SELECT 
    category, 
    COUNT(item_id) AS num_items
FROM joined_table 
WHERE order_id = 440
GROUP BY category;
-- Observation: Italian items dominate this order.
-- Note: Single-order analysis is illustrative, not representative.

-- View the category mix of the top 5 highest spend orders
/*
Top 5 orders:
440
2075
1957
330
2675
*/
WITH joined_table AS ( 
    SELECT *
    FROM menu_items AS m
    LEFT JOIN order_details AS o
        ON m.menu_item_id = o.item_id
)
SELECT 
    order_id, 
    category, 
    COUNT(item_id) AS num_items
FROM joined_table 
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY order_id, category;
-- Observation: Italian food appears frequently among high-spend orders.
-- Note: Pattern is exploratory due to small sample size.
