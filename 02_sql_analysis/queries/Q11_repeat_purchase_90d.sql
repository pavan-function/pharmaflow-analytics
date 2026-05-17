-- Q11: 90-Day Repeat Purchase Rate
-- Business question: What % of patients reorder within 90 days of first purchase?

WITH first_orders AS (
    SELECT patient_id, MIN(order_date) AS first_order_date
    FROM orders
    WHERE order_status = 'Delivered'
    GROUP BY patient_id
),
repeat_check AS (
    SELECT
        f.patient_id,
        f.first_order_date,
        MAX(CASE
            WHEN o.order_date > f.first_order_date
             AND o.order_date <= f.first_order_date + INTERVAL '90 days'
            THEN 1 ELSE 0
        END) AS made_repeat_purchase
    FROM first_orders f
    JOIN orders o ON f.patient_id = o.patient_id
    WHERE o.order_status = 'Delivered'
    GROUP BY f.patient_id, f.first_order_date
)
SELECT
    COUNT(*) AS total_patients,
    SUM(made_repeat_purchase) AS repeat_buyers,
    ROUND(SUM(made_repeat_purchase) * 100.0 / COUNT(*), 2) AS repeat_purchase_rate_pct
FROM repeat_check;
