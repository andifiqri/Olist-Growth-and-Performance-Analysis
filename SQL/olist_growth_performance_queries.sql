WITH order_level AS (
    SELECT   c.customer_unique_id,
             o.order_id,
             MIN(o.order_purchase_timestamp) OVER(PARTITION BY c.customer_unique_id) AS first_purchase_date,
             o.order_purchase_timestamp,
             LAG(o.order_purchase_timestamp) OVER(PARTITION BY c.customer_unique_id ORDER BY o.order_purchase_timestamp) AS prev_purchase_date,
             o.order_approved_at,
             SUM(op.payment_value) AS revenue
    FROM     orders o
    JOIN     customers c
             ON o.customer_id = c.customer_id
    JOIN     order_payments op
             ON o.order_id = op.order_id
    WHERE    o.order_status IN ('approved','delivered')
    GROUP BY c.customer_unique_id,
             o.order_id,
             o.order_purchase_timestamp,
             o.order_approved_at
),
cust_interpurchase_day AS (
    SELECT  *,
            DATEDIFF(DAY, prev_purchase_date, order_purchase_timestamp) AS interpurchase_day
    FROM    order_level
),
cust_recency AS (
SELECT   customer_unique_id,
         DATEDIFF(DAY, MAX(order_purchase_timestamp), '2018-10-17') AS recency
FROM     order_level
GROUP BY customer_unique_id
)
SELECT i.*,
       r.recency,
       CASE WHEN i.prev_purchase_date IS NULL THEN 'New Customer'
            WHEN i.interpurchase_day <= 122 THEN 'Retained Customer'
            ELSE 'Resurrected Customer'
       END AS customer_type,
       CASE WHEN r.recency <= 163 THEN 'Active'
            WHEN r.recency <= 395 THEN 'At-Risk'
            ELSE 'Churned'
       END AS customer_stage
FROM cust_interpurchase_day AS i
JOIN cust_recency AS r
     ON i.customer_unique_id = r.customer_unique_id;