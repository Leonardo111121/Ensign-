	/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_hello_world_5.2_ls.sql
PURPOSE: Create a view to list all player names from tblPlayerDim.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     [1/27/2025]   [Leonardo Salas]   1.  Dropped and re-created tblPlayerNames with constraints and primary key.


RUNTIME: 
Xm Xs

NOTES: 
This script refines the tblPlayerNames table by adding constraints, primary key, and appropriate data types.
******************************************************************************************************************/

-- Drop the table if it already exists
IF OBJECT_ID('tblPlayerNames', 'U') IS NOT NULL
    DROP TABLE tblPlayerNames;

-- Re-create the table with refined architecture
CREATE TABLE tblPlayerNames (
    PlayerID INT IDENTITY(1,1) PRIMARY KEY, 
    PlayerName NVARCHAR(100) NOT NULL      
);


INSERT INTO tblPlayerNames (PlayerName)
SELECT PlayerName
FROM vwPlayerNames;


SELECT * FROM tblPlayerNames;







