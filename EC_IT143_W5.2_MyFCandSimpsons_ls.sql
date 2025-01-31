-- /
***********************************************************************************
******************************
NAME: EC_IT143_W5.2_MyFC_ls.
PURPOSE: This script is designed to retrieve insights from the MyFC and Simpsons Financial Data databases. 
It answers key questions regarding player salaries, team composition, spending patterns, and employment 
relationships using SQL queries. The purpose is to transform dataset questions into actionable SQL statements 
for analysis and decision-making.

MODIFICATION LOG:
Ver     Date        Author           Description
-----   ----------  ---------        -----------------------------------------------
1.0     01/31/2025  Leonardo Salas   Initial script creation for EC IT143.

RUNTIME:
Xm Xs

NOTES:
This script was built as part of an academic exercise to demonstrate how to convert
dataset-related questions into SQL queries using SQL Server Management Studio (SSMS).
It includes queries for both MyFC and Simpsons Financial Data databases, leveraging 
JOINs, aggregations, and filtering to derive meaningful insights.
***********************************************************************************
*******************************/



-- 1. How do monthly salaries correlate with players?
SELECT p.pl_id, p.pl_name, f.mtd_salary
FROM [MyFC].[dbo].[tblPlayerDim] p
JOIN [MyFC].[dbo].[tblPlayerFact] f ON p.pl_id = f.pl_id
ORDER BY f.mtd_salary DESC;

-- 2. Which players have shown consistent salary growth?
SELECT f.pl_id, p.pl_name, f.as_of_date, f.mtd_salary
FROM [MyFC].[dbo].[tblPlayerFact] f
JOIN [MyFC].[dbo].[tblPlayerDim] p ON f.pl_id = p.pl_id
ORDER BY f.pl_id, f.as_of_date;

-- 3. How are players distributed across different positions in the team?
SELECT pos.p_name, COUNT(*) AS num_players
FROM [MyFC].[dbo].[tblPlayerDim] p
JOIN [MyFC].[dbo].[tblPositionDim] pos ON p.p_id = pos.p_id
GROUP BY pos.p_name;

-- 4. What percentage of the team's monthly salary is allocated to players in a specific position?
SELECT pos.p_name, (SUM(f.mtd_salary) * 100.0 / (SELECT SUM(mtd_salary) FROM [MyFC].[dbo].[tblPlayerFact])) AS percentage
FROM [MyFC].[dbo].[tblPlayerFact] f
JOIN [MyFC].[dbo].[tblPlayerDim] p ON f.pl_id = p.pl_id
JOIN [MyFC].[dbo].[tblPositionDim] pos ON p.p_id = pos.p_id
GROUP BY pos.p_name
ORDER BY percentage DESC;

-- Simpsons Financial Data Questions

-- 5. What are the spending patterns of the Simpsons family over the last 12 months?
SELECT Category, SUM(Amount) AS total_spent
FROM [Simpsons].[dbo].[Planet_Express]
WHERE Date >= DATEADD(MONTH, -12, GETDATE())
GROUP BY Category
ORDER BY total_spent DESC;

-- 6. What is the average tenure of employees in different departments?
SELECT Department, AVG(DATEDIFF(YEAR, Hire_Date, GETDATE())) AS avg_tenure
FROM [Simpsons].[dbo].[Family_Data]
WHERE Termination_Date IS NULL
GROUP BY Department;

-- 7. Which family member has the highest individual spending in the last year?
SELECT Card_Member, SUM(Amount) AS total_spent
FROM [Simpsons].[dbo].[Planet_Express]
WHERE Date >= DATEADD(YEAR, -1, GETDATE())
GROUP BY Card_Member
ORDER BY total_spent DESC
LIMIT 1;

-- 8. How do household expenses correlate with each family member's employment?
SELECT f.Name, SUM(p.Amount) AS total_expenses, f.Job_Title
FROM [Simpsons].[dbo].[Planet_Express] p
JOIN [Simpsons].[dbo].[Family_Data] f ON p.Card_Member = f.Name
GROUP BY f.Name, f.Job_Title