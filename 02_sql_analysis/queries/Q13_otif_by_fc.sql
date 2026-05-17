-- Q13: On-Time Delivery by Fulfillment Center
-- Business question: Which FC is the most reliable?

SELECT
    fc.fc_name,
    fc.country,
    COUNT(*) AS total_shipments,
    SUM(CASE WHEN s.on_time_delivery THEN 1 ELSE 0 END) AS on_time_shipments,
    ROUND(SUM(CASE WHEN s.on_time_delivery THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS otif_pct
FROM shipments s
JOIN orders o              ON s.order_id = o.order_id
JOIN fulfillment_centers fc ON o.fc_id = fc.fc_id
GROUP BY fc.fc_name, fc.country
ORDER BY otif_pct DESC;
