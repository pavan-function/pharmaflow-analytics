-- Q14: Cold Chain Performance vs Standard
-- Business question: How does temperature-controlled logistics compare?
-- Critical for insulin, biologics, certain dermatology Rx.

SELECT
    CASE WHEN s.cold_chain_required THEN 'Cold Chain' ELSE 'Standard' END AS shipment_type,
    COUNT(*) AS total_shipments,
    ROUND(AVG(s.delivery_days), 2) AS avg_delivery_days,
    ROUND(SUM(CASE WHEN s.on_time_delivery THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS otif_pct,
    ROUND(AVG(s.shipment_cost_eur), 2) AS avg_cost_eur
FROM shipments s
GROUP BY shipment_type
ORDER BY shipment_type;
