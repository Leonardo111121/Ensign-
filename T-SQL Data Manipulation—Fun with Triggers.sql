-- Step 1: Start with a question
-- Script: EC_IT143_6.3_fwt_s1_ls.sql
-- How to keep track of when a record was last modified?

-- Step 2: Begin creating an answer
-- Script: EC_IT143_6.3_fwt_s2_ls.sql
-- We need to add a 'last_modified_date' column and use an AFTER UPDATE trigger.

-- Step 3: Research and test a solution
-- Script: EC_IT143_6.3_fwt_s3_ls.sql
-- Reference: https://stackoverflow.com/questions/9522982/t-sql-trigger-update

-- Step 4: Create an after-update trigger
-- Script: EC_IT143_6.3_fwt_s4_ls.sql
-- /
-- "***********************************************************************************
--******************************
--NAME: Track Last Modification Trigger
--PURPOSE: Create a trigger to update the last modified date
--MODIFICATION LOG:
--Ver Date Author Description
----- ---------- -----------
-------------------------------------------------------------------------------
--1.0 05/23/2022 JJAUSSI 1. Built this script for EC IT440
--RUNTIME:
--Xm Xs
--NOTES:
--This trigger ensures that 'last_modified_date' is updated automatically on changes.
--***********************************************************************************
--*******************************/ 
-- Create audit table

CREATE TABLE dbo.w3_schools_customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(36) NOT NULL,
    ContactName VARCHAR(20) NOT NULL,
    Address VARCHAR(46) NOT NULL,
    City VARCHAR(15) NOT NULL,
    Country VARCHAR(9) NOT NULL,
    LastModifiedDate DATETIME DEFAULT GETDATE(),
    LastModifiedBy VARCHAR(50) DEFAULT SUSER_NAME()
);

INSERT INTO dbo.w3_schools_customers (CustomerID, CustomerName, ContactName, Address, City, Country)
SELECT CustomerID, CustomerName, ContactName, Address, City, Country 
FROM [EC_IT143_DA ].[dbo].[v_w3_schools_customers]


SELECT * FROM [EC_IT143_DA ].[dbo].[v_w3_schools_customers]


-- Create trigger on the base table that feeds the view
CREATE TRIGGER trg_update_w3_schools_customers
ON dbo.w3_schools_customers
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE dbo.w3_schools_customers
    SET LastModifiedDate = GETDATE(),
        LastModifiedBy = SUSER_NAME()
    WHERE CustomerID IN (SELECT DISTINCT CustomerID FROM inserted);
END;

-- Step 5: Test results to see if they are as expected
-- Script: EC_IT143_6.3_fwf_s5_ls.sql
UPDATE dbo.w3_schools_customers
SET ContactName = 'Nuevo Contacto'
WHERE CustomerID = 1;

-- Ver los cambios
SELECT * FROM dbo.w3_schools_customers WHERE CustomerID = 1;

-- Step 6: Ask the next question
-- Script: EC_IT143_6.3_fwf_s6_ls.sql
-- How to ensure audit log maintains integrity over time?

