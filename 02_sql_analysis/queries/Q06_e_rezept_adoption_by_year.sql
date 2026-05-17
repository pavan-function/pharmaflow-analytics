-- Q06: E-Rezept Adoption by Year (the headline strategic chart)
-- Business question: How fast did E-Rezept adoption grow post-mandate?

SELECT
    EXTRACT(YEAR FROM o.order_date) AS year,
    COUNT(*) AS rx_orders,
    SUM(CASE WHEN o.uses_e_rezept THEN 1 ELSE 0 END) AS e_rezept_orders,
    ROUND(SUM(CASE WHEN o.uses_e_rezept THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS e_rezept_adoption_pct
FROM orders o
WHERE o.is_prescription_order = TRUE
GROUP BY year
ORDER BY year;
