-- Join the three tables into ONE analysis-ready dataset 
-- (transaction + product + store details).

SELECT 
       t.transaction_id,
        -- (Standardized Date logic goes here)
        t.store_id,
        s.store_name,
        s.region,
        t.product_id,
        p.product_name,
        p.category,
       t.units,
       t.total_amount
FROM transactions t
INNER JOIN stores s ON t.store_id = s.store_id
INNER JOIN products p ON t.product_id = p.product_id;