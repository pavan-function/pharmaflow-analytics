-- Q05: AOV by Channel
-- Business question: Does Web, Mobile App, or Phone produce the highest AOV?

SELECT
    o.channel,
    COUNT(DISTINCT o.order_id) AS orders,
    ROUND(SUM(oi.line_total_eur), 2) AS revenue_eur,
    ROUND(SUM(oi.line_total_eur) / COUNT(DISTINCT o.order_id), 2) AS aov_eur
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY o.channel
ORDER BY revenue_eur DESC;
