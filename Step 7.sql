/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_hello_world_s7_ls.sql
PURPOSE: Create a stored procedure to reload data in tblPlayerNames from vwPlayerNames.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     [1/27/2025]   [Leonardo Salas]   1. Created stored procedure to truncate and reload tblPlayerNames.

RUNTIME: 
Xm Xs

NOTES: 
This stored procedure ensures tblPlayerNames is refreshed with the latest data from vwPlayerNames. 
It centralizes this functionality for reuse and consistency.
******************************************************************************************************************/


IF OBJECT_ID('uspReloadPlayerNames', 'P') IS NOT NULL
    DROP PROCEDURE uspReloadPlayerNames;
GO


CREATE PROCEDURE uspReloadPlayerNames
AS
BEGIN
    
    BEGIN TRANSACTION;

    
    PRINT 'Truncating tblPlayerNames...';
    TRUNCATE TABLE tblPlayerNames;

    
    PRINT 'Inserting data from vwPlayerNames...';
    INSERT INTO tblPlayerNames (PlayerName)
    SELECT PlayerName
    FROM vwPlayerNames;

 
    COMMIT TRANSACTION;

  
    PRINT 'Data successfully reloaded into tblPlayerNames.';
END;
GO


EXEC uspReloadPlayerNames;


SELECT * FROM tblPlayerNames;



