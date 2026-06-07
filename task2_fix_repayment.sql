-- ============================================================
-- Task 2: Fix Missing Repayment Channels
-- Goal: Fill missing repayment_channel values based on amount
--
-- Rules:
--   amount > 4000 → 'bank account'
--   amount < 1000 → 'mail'
--
-- Missing values include: NULL, '', 'NA', 'none', 'missing', 'null', '-', '--'
-- ============================================================

SELECT 
    repayment_id,
    loan_id,
    repayment_date,
    repayment_amount,
    CASE 
        WHEN (repayment_channel IS NULL 
              OR TRIM(repayment_channel) = ''
              OR TRIM(LOWER(repayment_channel)) 
                 IN ('na', 'none', 'missing', 'null', '-', '--'))
             AND repayment_amount > 4000 THEN 'bank account'
        WHEN (repayment_channel IS NULL 
              OR TRIM(repayment_channel) = ''
              OR TRIM(LOWER(repayment_channel)) 
                 IN ('na', 'none', 'missing', 'null', '-', '--'))
             AND repayment_amount < 1000 THEN 'mail'
        ELSE repayment_channel 
    END AS repayment_channel
FROM repayment;
