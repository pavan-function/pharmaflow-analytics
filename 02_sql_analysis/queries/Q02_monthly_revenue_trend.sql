-- Q02: Monthly Revenue Trend
-- Business question: Where are the seasonal peaks? (Q4 cold/flu surge expected)

SELECT
    DATE_TRUNC('month', o.order_date) AS month,
    ROUND(SUM(oi.line_total_eur), 2) AS revenue_eur,
    COUNT(DISTINCT o.order_id) AS orders
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY month
ORDER BY month;
