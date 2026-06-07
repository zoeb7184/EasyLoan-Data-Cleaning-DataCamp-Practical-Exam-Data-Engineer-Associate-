EasyLoan Data Cleaning & Analysis — DataCamp Practical Exam

 About This Project
This project is part of the DataCamp Data Analyst Certification Practical Exam. The goal was to clean, prepare, and analyze loan data for EasyLoan, a financial services company offering personal loans, car loans, and mortgages across USA, UK, and Canada.
This was not a straightforward exam. I spent considerable time studying SQL data cleaning techniques, reading through documentation, and debugging edge cases that are not obvious at first glance. The exam tested real-world skills — not just writing queries, but understanding why data is dirty and how to handle it systematically.
Before attempting this exam I studied and referenced the following resources:

📘 DataCamp — Data Cleaning in SQL
📘 DataCamp — Webinar: Data Cleaning for Everyone
📘 DataCamp Support — Assess Data Quality and Perform Validation Tasks
📘 PostgreSQL Official Docs — String Functions
📘 Towards Data Science — Common Data Cleaning Techniques
📘 Mode Analytics SQL Tutorial — Cleaning Data


 Files
FileDescriptiontask1_clean_client.sqlClean client table — fix types & invalid valuestask2_fix_repayment.sqlFill missing repayment channelstask3_usa_loans.sqlFilter USA loans from 2022 onwardstask4_avg_interest.sqlCompare average interest rates by loan type and country

 Database Schema

client — client personal details (id, DOB, employment status, country)
loan — loan details (type, principal, interest rate)
contract — contract signing dates
repayment — repayment records and channels
