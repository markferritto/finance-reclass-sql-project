# Finance Reclassification SQL Project

A mock finance SQL project that simulates real-world reclassification and conditional logic in a stored procedure. Built to align with a client use case involving UNION ALL logic, multi-table queries, and finance-related filtering and inserts.

## 🧩 What It Does

- Combines records from `invoices_active` and `invoices_archive` using `UNION ALL`
- Filters by `account_id = 123` and `customer_id = 'ABC001'`
- Reclassifies `'Consulting'` to `'Professional Services'`
- Conditionally inserts a "High Value Notice" row into `invoices_active` if any invoice exceeds `$10,000`

## 📦 Tech Stack

- PostgreSQL (PL/pgSQL)
- DBeaver for DB management
- VS Code for SQL file organization
- GitHub for version control

## 📁 Project Structure

