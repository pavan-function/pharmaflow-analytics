-- Q09: Chronic vs Acute Patient Revenue
-- Business question: How much more valuable are chronic-condition patients?

SELECT
    CASE WHEN p.has_chronic_condition THEN 'Chronic Patient' ELSE 'Acute Patient' END AS segment,
    COUNT(DISTINCT p.patient_id) AS patients,
    COUNT(DISTINCT o.order_id) AS orders,
    ROUND(SUM(oi.line_total_eur), 2) AS revenue_eur,
    ROUND(SUM(oi.line_total_eur) / COUNT(DISTINCT p.patient_id), 2) AS revenue_per_patient
FROM patients p
JOIN orders o       ON p.patient_id = o.patient_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY segment
ORDER BY revenue_eur DESC;
