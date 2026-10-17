WITH CustomerRanking AS (
    SELECT customer_name, sales,
           ROW_NUMBER() OVER (ORDER BY sales DESC) as row_num,
           RANK() OVER (ORDER BY sales DESC) as sales_rank
    FROM supermarket_sales
)
SELECT customer_name, sales, sales_rank
FROM CustomerRanking
WHERE sales > (SELECT AVG(sales) FROM supermarket_sales);