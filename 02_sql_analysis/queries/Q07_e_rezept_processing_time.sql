-- Q07: E-Rezept vs Paper Processing Time
-- Business question: Does digital prescriptions actually speed up fulfillment?

SELECT
    CASE WHEN o.uses_e_rezept THEN 'E-Rezept' ELSE 'Paper Prescription' END AS prescription_type,
    COUNT(*) AS shipments,
    ROUND(AVG(s.processing_hours), 2) AS avg_processing_hours,
    ROUND(MEDIAN(s.processing_hours), 2) AS median_processing_hours
FROM orders o
JOIN shipments s ON o.order_id = s.order_id
WHERE o.is_prescription_order = TRUE
GROUP BY prescription_type
ORDER BY avg_processing_hours;
