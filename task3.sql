-- ============================================================
-- Task 3: Analyze Loans for US Clients
-- Goal: Get loans for USA clients with contracts signed on or after 2022-01-01. Requires joining loan, contract, and client tables.
-- ============================================================

Solution
SELECT 
    l.client_id, 
    c.contract_date, 
    l.principal_amount, 
    l.loan_type
FROM loan l
JOIN contract c ON l.contract_id = c.contract_id
JOIN client cl ON l.client_id = cl.client_id
WHERE cl.country = 'USA' 
  AND c.contract_date >= '2022-01-01';