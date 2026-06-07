-- ============================================================
-- Task 4: Compare Average Interest Rates by Loan Type and Country
-- Goal: Calculate average interest rate grouped by loan_type and country. Requires joining loan and client tables.
-- ============================================================


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
