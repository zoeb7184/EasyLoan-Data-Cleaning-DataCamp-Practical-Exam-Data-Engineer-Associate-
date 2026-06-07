-- ============================================================
-- Task 1: Clean Client Table
-- Goal: Return client table with correct data types and valid values
-- 
-- Cleaning rules:
--   date_of_birth   → cast to DATE
--   employment_status → 'employed' or 'unemployed' (lowercase)
--                       Full-time / Part-time → 'employed'
--                       anything else         → NULL
--   country         → 'USA', 'UK', or 'CA' (uppercase)
--                       anything else         → NULL
-- ============================================================

-- Debugging: always run these first to see actual dirty values
-- SELECT DISTINCT employment_status, COUNT(*) FROM client GROUP BY 1;
-- SELECT DISTINCT country, COUNT(*) FROM client GROUP BY 1;

SELECT 
    client_id,
    CAST(date_of_birth AS DATE) AS date_of_birth,
    CASE 
        WHEN TRIM(LOWER(CAST(employment_status AS VARCHAR))) 
             IN ('employed', 'full-time', 'part-time') THEN 'employed'
        WHEN TRIM(LOWER(CAST(employment_status AS VARCHAR))) 
             = 'unemployed' THEN 'unemployed'
        ELSE NULL
    END AS employment_status,
    CASE 
        WHEN TRIM(UPPER(CAST(country AS VARCHAR))) = 'USA' THEN 'USA'
        WHEN TRIM(UPPER(CAST(country AS VARCHAR))) = 'UK'  THEN 'UK'
        WHEN TRIM(UPPER(CAST(country AS VARCHAR))) = 'CA'  THEN 'CA'
        ELSE NULL
    END AS country
FROM client;
