-- Q08: E-Rezept Adoption by Country
-- Business question: Which DACH markets are leading the digital prescription shift?

SELECT
    p.country,
    COUNT(*) AS rx_orders,
    SUM(CASE WHEN o.uses_e_rezept THEN 1 ELSE 0 END) AS e_rezept_orders,
    ROUND(SUM(CASE WHEN o.uses_e_rezept THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS adoption_pct
FROM orders o
JOIN patients p ON o.patient_id = p.patient_id
WHERE o.is_prescription_order = TRUE
GROUP BY p.country
ORDER BY adoption_pct DESC;
