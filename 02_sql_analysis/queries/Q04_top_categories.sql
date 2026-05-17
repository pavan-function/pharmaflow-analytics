-- Q04: Top Therapeutic Categories by Revenue
-- Business question: Which categories drive the most revenue?

SELECT
    p.category,
    COUNT(DISTINCT o.order_id) AS orders,
    ROUND(SUM(oi.line_total_eur), 2) AS revenue_eur,
    ROUND(AVG(oi.line_total_eur), 2) AS avg_line_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p     ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category
ORDER BY revenue_eur DESC;
