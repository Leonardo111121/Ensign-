/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_hello_world_s8_ls.sql
PURPOSE: Call the stored procedure to reload data into tblPlayerNames.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     [1/27/2025]   [Leonardo Salas]   1. Called the uspReloadPlayerNames stored procedure.

RUNTIME: 
Xm Xs

NOTES: 
This script demonstrates the execution of the uspReloadPlayerNames stored procedure, 
which refreshes tblPlayerNames with data from vwPlayerNames.
******************************************************************************************************************/


EXEC uspReloadPlayerNames;


SELECT * FROM tblPlayerNames;