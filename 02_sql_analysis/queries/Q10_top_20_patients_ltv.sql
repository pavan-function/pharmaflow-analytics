-- Q10: Top 20 Patients by Lifetime Value
-- Business question: Who are our most valuable patients (for VIP retention program)?

SELECT
    p.patient_id,
    p.country,
    p.city,
    p.has_chronic_condition,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.line_total_eur), 2) AS lifetime_value_eur
FROM patients p
JOIN orders o       ON p.patient_id = o.patient_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.patient_id, p.country, p.city, p.has_chronic_condition
ORDER BY lifetime_value_eur DESC
LIMIT 20;
