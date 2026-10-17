# Supermarket Sales SQL Mini Project 🛒📊

## Project Overview
This project is an advanced SQL data analysis task performed on supermarket sales data. It utilizes powerful SQL concepts to extract meaningful business insights, rank customers, and filter top-performing sales data.

## Technologies Used
* **MySQL** (Relational Database Management System)
* **SQL Concepts:** 
  * Common Table Expressions (CTEs / `WITH` clause)
  * Window Functions (`RANK()`, `ROW_NUMBER()`)
  * Subqueries & Aggregate Functions (`AVG`, `SUM`)

## Key Features & Queries
1. **Customer Ranking:** Utilized Window Functions (`RANK()`) to sort and rank customers based on their total sales.
2. **Advanced Filtering:** Implemented CTEs and Subqueries to isolate customers whose sales figures exceed the overall average store sales.

## Sample SQL Query
```sql
WITH CustomerRanking AS (
    SELECT customer_name, sales,
           ROW_NUMBER() OVER (ORDER BY sales DESC) as row_num,
           RANK() OVER (ORDER BY sales DESC) as sales_rank
    FROM supermarket_sales
)
SELECT customer_name, sales, sales_rank
FROM CustomerRanking
WHERE sales > (SELECT AVG(sales) FROM supermarket_sales);
