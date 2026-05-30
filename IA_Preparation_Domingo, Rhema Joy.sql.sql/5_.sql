-- Filter the transactions to the most recent full year.
-- Based on the data, the most recent full year is 2025.

SELECT 
    transaction_id,
    standardized_date,
    store_id,
    product_id,
    units,
    unit_price,
    total_amount
FROM (
    SELECT 
        *,
        CASE 
            WHEN date LIKE '____-__-__' THEN date
            WHEN date LIKE '%/%/%' THEN
                substr(date, -4) || '-' || 
                printf('%02d', CAST(substr(date, 1, instr(date, '/') - 1) AS INT)) || '-' || 
                printf('%02d', CAST(substr(date, instr(date, '/') + 1, length(date) - instr(date, '/') - 5) AS INT))
            ELSE
                substr(date, -4) || '-' ||
                CASE substr(date, 1, 3)
                    WHEN 'Jan' THEN '01' WHEN 'Feb' THEN '02' WHEN 'Mar' THEN '03'
                    WHEN 'Apr' THEN '04' WHEN 'May' THEN '05' WHEN 'Jun' THEN '06'
                    WHEN 'Jul' THEN '07' WHEN 'Aug' THEN '08' WHEN 'Sep' THEN '09'
                    WHEN 'Oct' THEN '10' WHEN 'Nov' THEN '11' WHEN 'Dec' THEN '12'
                END || '-' ||
                printf('%02d', CAST(trim(substr(date, instr(date, ' ') + 1, instr(date, ',') - instr(date, ' ') - 1)) AS INT))
        END AS standardized_date
    FROM transactions
)
WHERE standardized_date LIKE '2025%';
