-- Q03: Rx vs OTC Revenue Split
-- Business question: How much revenue comes from prescription vs OTC orders?

SELECT
    CASE WHEN o.is_prescription_order THEN 'Rx (Prescription)' ELSE 'OTC' END AS order_type,
    COUNT(DISTINCT o.order_id) AS orders,
    ROUND(SUM(oi.line_total_eur), 2) AS revenue_eur,
    ROUND(SUM(oi.line_total_eur) * 100.0 / SUM(SUM(oi.line_total_eur)) OVER (), 2) AS pct_of_total
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY order_type
ORDER BY revenue_eur DESC;
