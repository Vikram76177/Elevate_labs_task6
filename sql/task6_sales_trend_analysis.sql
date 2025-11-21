create database online_sales;
use online_sales;
SELECT * FROM online_sales.ecommerce_dataset_500_rows;

-- Monthly revenue and unique order count (year + month)
SELECT 
    EXTRACT(YEAR FROM STR_TO_DATE(order_date, '%m-%d-%Y')) AS year,
    EXTRACT(MONTH FROM STR_TO_DATE(order_date, '%m-%d-%Y')) AS month,
    SUM(COALESCE(total_price,0)) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM ecommerce_dataset_500_rows
WHERE STR_TO_DATE(order_date, '%m-%d-%Y') IS NOT NULL
GROUP BY year, month
ORDER BY year, month;


-- Top 3 months Revenue
SELECT 
    EXTRACT(YEAR FROM STR_TO_DATE(order_date, '%m-%d-%Y')) AS year,
    EXTRACT(MONTH FROM STR_TO_DATE(order_date, '%m-%d-%Y')) AS month,
    SUM(COALESCE(total_price,0)) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM ecommerce_dataset_500_rows
WHERE STR_TO_DATE(order_date, '%m-%d-%Y') IS NOT NULL
GROUP BY year, month
ORDER BY monthly_revenue DESC
LIMIT 3;


