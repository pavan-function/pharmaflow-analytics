-- Q17: Return Rate by Category
-- Business question: Which categories drive return volume?
-- Note: Rx orders are legally non-returnable in DE, so this is OTC only.

WITH otc_orders_by_cat AS (
    SELECT
        p.category,
        COUNT(DISTINCT o.order_id) AS total_orders
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p     ON oi.product_id = p.product_id
    WHERE o.is_prescription_order = FALSE
      AND o.order_status = 'Delivered'
    GROUP BY p.category
),
returns_by_cat AS (
    SELECT
        p.category,
        COUNT(DISTINCT r.return_id) AS total_returns
    FROM returns r
    JOIN order_items oi ON r.order_id = oi.order_id
    JOIN products p     ON oi.product_id = p.product_id
    GROUP BY p.category
)
SELECT
    o.category,
    o.total_orders,
    COALESCE(r.total_returns, 0) AS total_returns,
    ROUND(COALESCE(r.total_returns, 0) * 100.0 / o.total_orders, 2) AS return_rate_pct
FROM otc_orders_by_cat o
LEFT JOIN returns_by_cat r ON o.category = r.category
ORDER BY return_rate_pct DESC;
