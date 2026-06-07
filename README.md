# 🏦 EasyLoan Data Cleaning — DataCamp Practical Exam

EasyLoan offers loan services across USA, UK and Canada.
The analytics team needed clean, reliable data before reporting.
This repo contains SQL solutions for all tasks.

---

## 📁 Files

| File | Description |
|------|-------------|
| `task1_clean_client.sql` | Clean client table — fix types & invalid values |
| `task2_fix_repayment.sql` | Fill missing repayment channels |

---

## 🗄️ Database Schema

**client** — client personal details  
**repayment** — loan repayment records

---

## ✅ Task 1 — Clean Client Table

### Goal
Return a cleaned `client` table with correct data types and standardized values.

| Column | Expected Format |
|--------|----------------|
| client_id | Unique integer |
| date_of_birth | DATE |
| employment_status | `employed` or `unemployed` (lowercase only) |
| country | `USA`, `UK`, or `CA` (uppercase only) |

### ⚠️ Issues Faced

**Issue 1 — Date Display Confusion**  
DataLab renders dates as `YYYY-MM-DDThh:mm:ss.000` even when correctly cast as `DATE`.  
Spent time thinking the cast was wrong — it wasn't.  
> **Lesson:** Trust the data type, not how DataLab displays it.

**Issue 2 — Non-standard `employment_status` values**  
Expected only 2 values. Found 5 in the actual data:

| Raw Value | Cleaned Value |
|-----------|--------------|
| `employed` | `employed` |
| `Employed` | `employed` |
| `Full-time` | `employed` |
| `Part-time` | `employed` |
| `unemployed` | `unemployed` |

Simple `LOWER()` was not enough — `Full-time` and `Part-time` needed explicit mapping.

**Issue 3 — Assuming only NULL = missing**  
Non-standard representations like `''`, `'NA'`, `'none'` were not caught by `IS NULL` alone.

### ✅ Final Solution

```sql
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
        WHEN TRIM(UPPER(CAST(country AS VARCHAR))) = 'UK' THEN 'UK'
        WHEN TRIM(UPPER(CAST(country AS VARCHAR))) = 'CA' THEN 'CA'
        ELSE NULL
    END AS country
FROM client;
```

### 🔍 Debugging Query Used

```sql
-- Always explore distinct values BEFORE cleaning
SELECT DISTINCT employment_status, COUNT(*) FROM client GROUP BY 1;
SELECT DISTINCT country, COUNT(*) FROM client GROUP BY 1;
```

---

## ✅ Task 2 — Fix Missing Repayment Channels

### Goal
Fill missing `repayment_channel` values based on amount:

| Condition | Channel |
|-----------|---------|
| amount > 4000 | `bank account` |
| amount < 1000 | `mail` |

### ⚠️ Issues Faced
Missing values were not only `NULL` — they included `''`, `'NA'`, `'none'`, `'missing'` etc.

### ✅ Final Solution

```sql
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
```

---

## 🔑 Key Lessons Learned

1. **Never assume missing = NULL only** — always check for `''`, `'NA'`, `'none'`, `'missing'`
2. **Always explore distinct values first** before writing cleaning logic
3. **Display format ≠ data type** — DataLab timestamp display does not mean your DATE cast is wrong
4. **Domain knowledge matters** — `Full-time` and `Part-time` map to `employed` only if you understand the business context
5. **LOWER() alone is not enough** — non-standard category labels need explicit mapping

---

## 🛠️ Tech Stack

- PostgreSQL
- DataCamp DataLab
