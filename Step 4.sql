	/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_hello_world_s4_ls.sql
PURPOSE: Create a view to list all player names from tblPlayerDim.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     [1/27/2025]   [Leonardo Salas]   1. Created this script to encapsulate Step 3 as a reusable view.

RUNTIME: 
Xm Xs

NOTES: 
This script creates a view to simplify access to player names, improving data model resiliency and query reuse.
******************************************************************************************************************/

-- Q1: What should go here?
-- A1: The question is "What are the names of all players in the database?"
-- This script turns the answer from Step 3 into a reusable view.

CREATE VIEW vwPlayerNames AS
SELECT 
    pl_name AS PlayerName
FROM 
    tblPlayerDim;


SELECT * FROM vwPlayerNames;




