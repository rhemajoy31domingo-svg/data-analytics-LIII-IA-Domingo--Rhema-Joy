-- handle the blank units and
-- the NULL region sensibly;

-- We use COALESCE and NULLIF to handle missing values.
-- NULLIF converts empty strings ('') to NULL.
-- COALESCE replaces NULL values with a default (0 for units, 'Unknown' for region).

SELECT 
    store_id,
    store_name,
    COALESCE(NULLIF(region, ''), 'Visayas') AS region
FROM stores;

SELECT 
    transaction_id,
    date,
    store_id,
    product_id,
    COALESCE(NULLIF(units, ''), 0) AS units,
    unit_price,
    total_amount
FROM transactions;