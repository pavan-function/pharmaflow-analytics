-- Q15: Carrier Performance Ranking
-- Business question: Which carriers are letting us down?

SELECT
    s.carrier,
    COUNT(*) AS shipments,
    ROUND(AVG(s.delivery_days), 2) AS avg_delivery_days,
    ROUND(SUM(CASE WHEN s.on_time_delivery THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS otif_pct,
    ROUND(AVG(s.shipment_cost_eur), 2) AS avg_cost_eur
FROM shipments s
GROUP BY s.carrier
ORDER BY otif_pct DESC;
