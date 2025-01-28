	/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_hello_world_s5_ls.sql
PURPOSE: Create a view to list all player names from tblPlayerDim.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     [1/27/2025]   [Leonardo Salas]   1. Created table tblPlayerNames from the vwPlayerNames view.


RUNTIME: 
Xm Xs

NOTES: 
This script creates a table from the vwPlayerNames view to persist data for further operations.
******************************************************************************************************************/

-- Create a new table from the view
SELECT 
    PlayerName
INTO 
    tblPlayerNames
FROM 
    vwPlayerNames;

-- Verify the new table
SELECT * FROM tblPlayerNames;






