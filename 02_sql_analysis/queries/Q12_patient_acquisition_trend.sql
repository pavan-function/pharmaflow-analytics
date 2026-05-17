-- Q12: Patient Acquisition Trend
-- Business question: How is new patient signup trending month-over-month?

SELECT
    DATE_TRUNC('month', signup_date) AS month,
    COUNT(*) AS new_patients
FROM patients
GROUP BY month
ORDER BY month;
