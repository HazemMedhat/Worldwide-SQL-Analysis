/* Total sales per customer (with customer name).*/
SELECT Cust.Customer as Customer_Name , SUM(Sale.[Total Including Tax]) AS Total_Sales
FROM [Dimension].[Customer] AS Cust , [Fact].[Sale] AS Sale
WHERE Cust.[Customer Key] = Sale.[Customer Key]
GROUP BY Cust.Customer

/* Number of sales transactions per city. */
SELECT Cty.City as City_Name , COUNT(Sale.[Total Including Tax]) AS Number_Of_Sales
FROM [Dimension].[City] AS Cty , [Fact].[Sale] AS Sale
WHERE Cty.[City Key] = Sale.[City Key]
GROUP BY Cty.City

/* Maximum sale value per employee.*/
SELECT emp.Employee as Employee_Name , MAX(Sale.[Total Including Tax]) AS Max_Sale_Value
FROM [Dimension].[Employee] AS emp , [Fact].[Sale] AS Sale
WHERE emp.[Employee Key] = Sale.[Salesperson Key]
GROUP BY emp.Employee

/* Average quantity sold per product.*/
SELECT STO.[Stock Item] AS Product_Name , AVG(Ord.Quantity) AS Average_quantity
FROM [Dimension].[Stock Item] AS STO , [Fact].[Order] AS Ord
WHERE STO.[Stock Item Key] = Ord.[Stock Item Key]
GROUP BY STO.[Stock Item]

/* Total sales per year.*/
SELECT dt.[Calendar Year] AS Year , SUM(Sale.[Total Including Tax]) AS Total_Sales
FROM [Dimension].[Date] AS dt , [Fact].[Sale] AS Sale
WHERE dt.Date = Sale.[Delivery Date Key]
GROUP BY dt.[Calendar Year]

/* Number of orders per brand.*/
SELECT STO.Brand AS Brand_Name , COUNT(ord.[Order Key]) AS Number_of_orders
FROM [Dimension].[Stock Item] AS STO , [Fact].[Order] AS ord
WHERE STO.[Stock Item Key] = ord.[Stock Item Key]
GROUP BY STO.Brand

/* Total sales by city and year.*/
SELECT cty.City AS City_Name , dt.[Calendar Year] AS Year , SUM(Sale.[Total Including Tax]) AS total_sales
FROM [Fact].[Sale] AS Sale
JOIN [Dimension].[City] cty ON Sale.[City Key] = cty.[City Key]
JOIN [Dimension].[Date] dt ON Sale.[Delivery Date Key] = dt.Date
GROUP BY cty.City, dt.[Calendar Year]
ORDER BY cty.City, dt.[Calendar Year]

/* Number of customers per country.*/
SELECT cty.Country, COUNT(DISTINCT cust.[Customer Key]) AS Number_Of_Customers
FROM [Dimension].[Customer] AS cust
JOIN [Fact].[Sale] AS s ON cust.[Customer Key] = s.[Customer Key]
JOIN [Dimension].[City] AS cty ON s.[City Key] = cty.[City Key]
GROUP BY cty.Country
ORDER BY Number_Of_Customers DESC;

/*Total sales per customer and their assigned salesperson.*/
SELECT cust.Customer AS Customer_Name , emp.Employee AS Sales_Person_Name , SUM(s.[Total Including Tax]) AS Total_Sales
FROM [Dimension].[Customer] AS cust
JOIN [Fact].[Sale] AS s ON cust.[Customer Key] = s.[Customer Key]
JOIN [Dimension].[Employee] AS emp ON s.[Salesperson Key] = emp.[Employee Key]
WHERE emp.[Is Salesperson] = 1
GROUP BY cust.Customer , emp.Employee

/*The top-selling product by total quantity.*/
SELECT TOP 1 
	STO.[Stock Item] AS Product_Name , SUM(O.Quantity) AS Total_Quantity
FROM [Dimension].[Stock Item] AS STO , [Fact].[Order] AS O
WHERE STO.[Stock Item Key] = O.[Stock Item Key]
GROUP BY STO.[Stock Item]
ORDER BY Total_Quantity