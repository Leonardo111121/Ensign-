-- Step 1: Start with a question
-- Script: EC_IT143_6.3_fwf_s1_ls.sql
-- How to extract the first name from Contact Name?

-- Step 2: Begin creating an answer
-- Script: EC_IT143_6.3_fwf_s2_ls.sql
-- Extracting the first name requires splitting the ContactName column by the first space.

-- Step 3: Create an ad hoc SQL query
-- Script: EC_IT143_6.3_fwf_s3_ls.sql
SELECT ContactName, LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS FirstName
FROM [EC_IT143_DA ].[dbo].[v_w3_schools_customers]

-- Step 4: Research and test a solution
-- Script: EC_IT143_6.3_fwf_s4_ls.sql
--/
--***********************************************************************************
--******************************
--NAME: Extract First Name Research
--PURPOSE: Research and test SQL function for extracting first name
--MODIFICATION LOG:
--Ver Date Author Description
----- ---------- -----------
-------------------------------------------------------------------------------
--1.0 05/23/2022 JJAUSSI 1. Built this script for EC IT440
--RUNTIME:
--Xm Xs
--NOTES:
--This script verifies the approach using Stack Overflow resources and SQL functions.
--***********************************************************************************
--*******************************/

-- Q1: How to extract the first name from Contact Name?
-- A1: This query extracts the first name by using LEFT() and CHARINDEX()
SELECT GETDATE() AS my_date;
-- Verified solution using Stack Overflow reference: https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name

-- Step 5: Create a user-defined scalar function
-- Script: EC_IT143_6.3_fwf_s5_ls.sql
CREATE FUNCTION dbo.udf_parse_first_name(@FullName VARCHAR(500))
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @FirstName VARCHAR(100);
    SET @FirstName = LEFT(@FullName, CHARINDEX(' ', @FullName + ' ') - 1);
    RETURN @FirstName;
END;
GO

-- Step 6: Compare UDF results to ad hoc query results
-- Script: EC_IT143_6.3_fwf_s6_ls.sql
SELECT ContactName,
       LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS FirstName,
       dbo.udf_parse_first_name(ContactName) AS FirstName_UDF
FROM [EC_IT143_DA ].[dbo].[v_w3_schools_customers]

-- Step 7: Perform a "0 results expected" test
-- Script: EC_IT143_6.3_fwf_s7_ls.sql

SELECT ContactName,
       LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS FirstName,
       dbo.udf_parse_first_name(ContactName) AS FirstName_UDF
FROM [EC_IT143_DA ].[dbo].[v_w3_schools_customers]
WHERE LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) 
      <> dbo.udf_parse_first_name(ContactName);



-- Expected result: 0 rows

-- Step 8: Ask the next question
-- Script: EC_IT143_6.3_fwf_s8_ls.sql
-- How to extract the last name from Contact Name?
SELECT ContactName, RIGHT(ContactName, LEN(ContactName) - CHARINDEX(' ', ContactName + '')) AS LastName
FROM [EC_IT143_DA ].[dbo].[v_w3_schools_customers]
