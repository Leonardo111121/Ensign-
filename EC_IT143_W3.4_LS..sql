/*****************************************************************************************************************
NAME:    My Script Name
PURPOSE: My script purpose...

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   --------   -------------------------------------------------------------------------------
1.0     01/21/2022   Leonardo S     1. Built this script for EC IT440


RUNTIME: 
Xm Xs

NOTES: 
This is where I talk about what this script is, why I built it, and other stuff...
 
******************************************************************************************************************/

-- Q1: What are the five products with the highest inventory currently?- Leonardo Salas
-- A1: 
SELECT TOP 5 
    pi.ProductID, 
    p.Name AS ProductName, 
    SUM(pi.Quantity) AS TotalInventory
FROM [AdventureWorks2022].[Production].[ProductInventory] AS pi
JOIN [AdventureWorks2022].[Production].[Product] AS p ON pi.ProductID = p.ProductID
GROUP BY pi.ProductID, p.Name
ORDER BY TotalInventory DESC;


-- Q2: Can you list all tables that include columns related to products, such as "ProductID" or "ProductSubcategoryID"?- Leonardo Salas
-- A2: 
SELECT 
    TABLE_SCHEMA,
    TABLE_NAME,
    COLUMN_NAME
FROM [AdventureWorks2022].INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME IN ('ProductID', 'ProductSubcategoryID')
ORDER BY TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME;

-- Q3: Business User Questions—Moderate Complexity: What is the total revenue for each product category, and which category generated the highest revenue?- Ikechukwu Madumere
-- A3: 
SELECT 
    pc.Name AS ProductCategory, 
    SUM(sod.LineTotal) AS TotalRevenue
FROM [AdventureWorks2022].[Sales].[SalesOrderDetail] AS sod
JOIN [AdventureWorks2022].[Production].[Product] AS p ON sod.ProductID = p.ProductID
JOIN [AdventureWorks2022].[Production].[ProductSubcategory] AS psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN [AdventureWorks2022].[Production].[ProductCategory] AS pc ON psc.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name
ORDER BY TotalRevenue DESC;

-- Q4: Business User Questions—Moderate Complexity: How many customers made purchases in each year, and which year had the most active customers? -Ikechukwu Madumere
-- A4: 
SELECT 
    YEAR(soh.OrderDate) AS OrderYear, 
    COUNT(DISTINCT soh.CustomerID) AS ActiveCustomers
FROM [AdventureWorks2022].[Sales].[SalesOrderHeader] AS soh
GROUP BY YEAR(soh.OrderDate)
ORDER BY ActiveCustomers DESC;

-- Q5: What is the total revenue generated from sales in the SalesOrderHeader table? -Ikechukwu Madumere
-- A5: 
SELECT 
    SUM(TotalDue) AS TotalRevenue
FROM [AdventureWorks2022].[Sales].[SalesOrderHeader];

-- Q6: Business User Questions—Marginal Complexity: How many products are currently listed in the Product table? -Ikechukwu Madumere
-- A6:  
SELECT 
    COUNT(*) AS TotalProducts
FROM [AdventureWorks2022].[Production].[Product];

-- Q7: Metadata question— What are the names and data types of all columns in the Product table as listed in Information_schema.columns? -Ikechukwu Madumere
-- A7:  
SELECT 
    COLUMN_NAME, 
    DATA_TYPE
FROM [AdventureWorks2022].INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Product';

-- Q8: Metadata question — How many stored procedures exist in the database, and what are their names as shown in Information_schema.routines? -Ikechukwu Madumere
-- A8:  
SELECT 
    COUNT(*) AS TotalStoredProcedures
FROM [AdventureWorks2022].INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_TYPE = 'PROCEDURE';


SELECT 
    ROUTINE_NAME
FROM [AdventureWorks2022].INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_TYPE = 'PROCEDURE';

