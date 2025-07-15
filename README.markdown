# Worldwide Importers Data Analysis

## Overview
This project contains SQL queries designed to analyze the "Worldwide Importers" dataset. The queries provide insights into sales, customer behavior, employee performance, and product trends. The dataset includes tables such as `[Dimension].[Customer]`, `[Dimension].[City]`, `[Dimension].[Employee]`, `[Dimension].[Stock Item]`, `[Dimension].[Date]`, `[Fact].[Sale]`, and `[Fact].[Order]`.

## Queries and Their Purpose
Below is a summary of the SQL queries included in the `SQL Analysis.sql` file and their objectives:

1. **Total Sales per Customer**  
   Computes the total sales amount (including tax) for each customer, displaying their name and total sales.

2. **Number of Sales Transactions per City**  
   Counts the number of sales transactions for each city, providing insights into regional sales activity.

3. **Maximum Sale Value per Employee**  
   Identifies the highest single sale value achieved by each employee (salesperson).

4. **Average Quantity Sold per Product**  
   Calculates the average quantity sold for each product, based on order data.

5. **Total Sales per Year**  
   Aggregates total sales (including tax) by calendar year, showing yearly sales trends.

6. **Number of Orders per Brand**  
   Counts the number of orders associated with each brand in the stock items.

7. **Total Sales by City and Year**  
   Summarizes total sales by city and calendar year, ordered by city and year for easy analysis.

8. **Number of Customers per Country**  
   Counts unique customers per country, sorted by the number of customers in descending order.

9. **Total Sales per Customer and Assigned Salesperson**  
   Aggregates total sales for each customer, including the name of their assigned salesperson (filtered for employees marked as salespeople).

10. **Top-Selling Product by Total Quantity**  
    Identifies the product with the highest total quantity sold across all orders.

## Dataset Schema
The "Worldwide Importers" dataset includes the following key tables used in the queries:
- `[Dimension].[Customer]`: Contains customer details (e.g., `Customer Key`, `Customer`).
- `[Dimension].[City]`: Stores city information (e.g., `City Key`, `City`, `Country`).
- `[Dimension].[Employee]`: Includes employee data (e.g., `Employee Key`, `Employee`, `Is Salesperson`).
- `[Dimension].[Stock Item]`: Contains product details (e.g., `Stock Item Key`, `Stock Item`, `Brand`).
- `[Dimension].[Date]`: Stores date-related information (e.g., `Date`, `Calendar Year`).
- `[Fact].[Sale]`: Records sales transactions (e.g., `Customer Key`, `City Key`, `Salesperson Key`, `Total Including Tax`, `Delivery Date Key`).
- `[Fact].[Order]`: Contains order details (e.g., `Stock Item Key`, `Order Key`, `Quantity`).

## Usage
To use these queries:
1. Ensure you have access to the "Worldwide Importers" database.
2. Run the queries in a SQL environment (e.g., SQL Server Management Studio).
3. Modify table or column names if your schema differs slightly.

## Notes
- Most queries use implicit joins (e.g., `WHERE` clause) for simplicity, except for the "Total Sales by City and Year" and "Number of Customers per Country" queries, which use explicit `JOIN` syntax for clarity.
- The "Top-Selling Product by Total Quantity" query uses `TOP 1` to return only the top result.
- Ensure the `Is Salesperson` flag is correctly set in the `[Dimension].[Employee]` table for accurate results in the "Total Sales per Customer and Assigned Salesperson" query.

## Contributing
Feel free to fork this repository, add new queries, or optimize existing ones. Submit pull requests with clear descriptions of changes.

## License
This project is licensed under the MIT License.