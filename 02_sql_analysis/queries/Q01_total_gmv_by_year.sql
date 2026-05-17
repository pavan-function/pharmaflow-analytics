-- Q01: Total GMV by Year
-- Business question: What is our annual revenue, and is it growing?

SELECT
    EXTRACT(YEAR FROM o.order_date) AS year,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.line_total_eur), 2) AS gmv_eur
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY year
ORDER BY year;
