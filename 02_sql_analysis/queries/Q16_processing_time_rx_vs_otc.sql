-- Q16: Processing Time — Rx vs OTC Orders
-- Business question: Where do prescription orders bottleneck vs OTC?

SELECT
    CASE WHEN o.is_prescription_order THEN 'Rx Order' ELSE 'OTC Order' END AS order_type,
    COUNT(*) AS shipments,
    ROUND(AVG(s.processing_hours), 2) AS avg_processing_hours,
    ROUND(MIN(s.processing_hours), 2) AS min_hours,
    ROUND(MAX(s.processing_hours), 2) AS max_hours
FROM orders o
JOIN shipments s ON o.order_id = s.order_id
GROUP BY order_type
ORDER BY avg_processing_hours;
