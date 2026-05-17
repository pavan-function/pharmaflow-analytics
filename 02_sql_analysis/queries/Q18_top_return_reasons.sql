-- Q18: Top Return Reasons
-- Business question: Why are customers returning items?

SELECT
    r.return_reason,
    COUNT(*) AS return_count,
    ROUND(SUM(r.refund_amount_eur), 2) AS total_refund_eur,
    ROUND(AVG(r.refund_amount_eur), 2) AS avg_refund_eur,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS pct_of_returns
FROM returns r
GROUP BY r.return_reason
ORDER BY return_count DESC;
