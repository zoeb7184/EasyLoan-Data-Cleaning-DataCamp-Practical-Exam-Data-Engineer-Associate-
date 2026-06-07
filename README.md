# 🏦 EasyLoan Data Cleaning & Analysis 
**A DataCamp Data Analyst Certification Practical Exam Project by Zoeb Ali Khan**

## 📖 About This Project
This project is part of the **DataCamp Data Analyst Certification Practical Exam**. The goal was to clean, prepare, and analyze loan data for EasyLoan, a financial services company offering personal loans, car loans, and mortgages across the USA, the UK, and Canada. 

> **Note on the process:** This was not a straightforward exam. I spent considerable time studying SQL data cleaning techniques, reading through documentation, and debugging edge cases that are not obvious at first glance. The exam tested real-world skills—not just writing queries, but understanding *why* data is dirty and how to handle it systematically.

---

## 📚 Study Materials & Resources
Before attempting this exam, I studied and referenced the following resources to build a solid foundation in data validation and string manipulation:

* **DataCamp:** Data Cleaning in SQL
* **DataCamp:** Webinar - Data Cleaning for Everyone
* **DataCamp Support:** Assess Data Quality and Perform Validation Tasks
* **PostgreSQL Official Docs:** String Functions
* **Towards Data Science:** Common Data Cleaning Techniques
* **Mode Analytics SQL Tutorial:** Cleaning Data

---

## 📂 Project Files
The project is broken down into four primary SQL tasks, each focusing on a different aspect of data cleaning and analysis.

| File Name | Task Description |
| :--- | :--- |
| `task1_clean_client.sql` | Cleans the `client` table by fixing data types and standardizing invalid string values. |
| `task2_fix_repayment.sql` | Identifies and systematically fills missing values in the repayment channels. |
| `task3_usa_loans.sql` | Joins tables to filter and analyze loans specifically for USA clients from 2022 onwards. |
| `task4_avg_interest.sql` | Aggregates data to compare average interest rates grouped by loan type and country. |

---

## 🗄️ Database Schema
The analysis relies on a relational database containing four primary tables:

* **`client`**: Contains personal details (`id`, `DOB`, `employment status`, `country`).
* **`loan`**: Contains specific loan details (`type`, `principal`, `interest rate`).
* **`contract`**: Tracks contract signing dates.
* **`repayment`**: Logs repayment records and the specific channels used.
