Retail Sales Analysis Using SQL

Project Overview

This project uses MySQL to explore and analyze retail sales data.
The goal is to clean and inspect the dataset, answer business questions,
and identify patterns in sales, customer behavior, product categories,
and order timing.

Tools Used

MySQL

SQL queries for data validation, exploration, aggregation, and
business analysis

Dataset

The analysis uses a table named retail_sales.

The SQL script references these columns:

Column                              Description

transaction_id                    Identifier for a transaction

sale_date                         Date of the sale

sale_time                         Time of the sale

customer_id                       Identifier for the customer

gender                            Customer gender

age                               Customer age

category                          Product category

quantiy                           Quantity sold (column name as
present in the source table)

price_per_unit                    Price per unit

cogs                              Cost of goods sold

total_sale                        Total value of the sale

Note: The source column is spelled quantiy in the SQL file. If
you correct it to quantity in your database, update the queries
accordingly.

Project Workflow

Create and select the project database.

Rename the imported source table to retail_sales.

Rename the transaction ID column to transaction_id.

Check the number of records.

Check for missing values in important columns.

Explore overall sales and distinct customers.

Answer business questions using filtering, aggregation, grouping,
sorting, and conditional logic.

Business Questions Answered

Retrieve all sales made on November 5, 2022.

Find Clothing transactions with more than 10 items sold during
November 2022.

Calculate total sales for each product category.

Find the average customer age for purchases in the Beauty category.

Retrieve transactions where total sales exceed 1,000.

Count transactions by gender and product category.

Calculate average sales by month and identify the month with the
highest average sale in the current query.

Find the top five customers by total sales.

Count unique customers in each product category.

Group orders into Morning, Afternoon, and Evening shifts based on
sale time.

SQL Concepts Practiced

CREATE DATABASE and USE

RENAME TABLE and ALTER TABLE

SELECT, WHERE, and IS NULL

COUNT() and COUNT(DISTINCT ...)

SUM() and AVG()

GROUP BY and ORDER BY

LIMIT

Date filtering

CASE WHEN

HOUR() for time-based grouping

How to Run

Install or open MySQL Workbench or another MySQL client.

Import the retail sales dataset into your MySQL server.

Open sql project retail_sales.sql.

Review the database and table names in the setup section. If your
imported table has a different name, update the RENAME TABLE
statement.

Run the script in sections, from top to bottom, and review each
result set.

Important Notes and Possible Improvements

The missing-value query checks whether important fields contain
NULL; it does not automatically remove or repair those records.

The current Question 7 query groups by month number only and returns
the single month with the highest average sale overall. To find the
best month for each year, group by both YEAR(sale_date) and
MONTH(sale_date), then rank the months within each year.

The shift query uses HOUR(sale_time) <= 12 for Morning, hours
13--17 for Afternoon, and later hours for Evening. Confirm that this
interpretation matches the business definition of the shifts.

The SQL script assumes the table and columns have already been
imported with names compatible with the setup statements.

Project Goal

This project demonstrates practical SQL skills for a beginner data
analytics portfolio, including data quality checks, exploratory
analysis, and answering business questions from a retail sales dataset.
