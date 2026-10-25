create database sql_project_p2;
use sql_project_p2;


RENAME TABLE `sql - retail sales analysis_utf` TO retail_sales;

SELECT 
    COUNT(*)
FROM
    retail_sales;

alter table retail_sales 
rename column ï»¿transactions_id to transaction_id;

select * from retail_sales
where 
     transaction_id is null
     or sale_date is null
     or sale_time is null 
     or customer_id is null 
     or gender is null 
     or age is null
     or category is null
     or quantiy is null 
     or price_per_unit is null 
     or cogs is null 
     or total_sale is null;

-- data exploration   

-- 1) how many sales we have ?
select count(total_sale)
from retail_sales;
-- 2) how many  unique customers we have ?

select count(distinct customer_id) as total_customer 
 from retail_sales;
 
-- data analysis & business key probless & answers 
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)


-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05 
select * 
from retail_sales
where sale_date = '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
 SELECT 
    category, quantiy, sale_date
FROM
    retail_sales
WHERE
    category = 'clothing' AND quantiy > 10
        AND sale_date >= '2022-11-1'
        AND sale_date < '2022-12-1';

--  Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT 
    SUM(total_sale), category
FROM
    retail_sales
GROUP BY category;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
SELECT 
    AVG(age) AS avg_age, category
FROM
    retail_sales
WHERE
    category = 'Beauty'
GROUP BY category; 

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
SELECT 
    *
FROM
    retail_sales
WHERE
    total_sale > 1000;
--  Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

SELECT 
    COUNT(transaction_id), gender, category
FROM
    retail_sales
GROUP BY gender , category;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year 
SELECT
    MONTH(sale_date) AS month,
    AVG(total_sale) AS avg_sale
FROM retail_sales
GROUP BY  MONTH(sale_date)
ORDER BY  avg_sale desc
limit 1 ; 

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
SELECT 
    customer_id, sum(total_sale) AS max_total_sales
FROM
    retail_sales
GROUP BY customer_id
ORDER BY max_total_sales DESC
LIMIT 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
SELECT 
    category, COUNT(DISTINCT customer_id)
FROM
    retail_sales
GROUP BY category;

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

SELECT
    CASE
        WHEN HOUR(sale_time) <= 12 THEN 'Morning'
        WHEN HOUR(sale_time) BETWEEN 13 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS number_of_orders
FROM retail_sales

-- End of project 
