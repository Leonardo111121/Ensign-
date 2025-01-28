
	/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_hello_world_s6_ls.sql
PURPOSE: Create a view to list all player names from tblPlayerDim.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     [1/27/2025]   [Leonardo Salas]   1.  Truncated and reloaded tblPlayerNames with data from vwPlayerNames.


RUNTIME: 
Xm Xs

NOTES: 
This script ensures tblPlayerNames is refreshed with the latest data from vwPlayerNames.
******************************************************************************************************************/


TRUNCATE TABLE tblPlayerNames;


INSERT INTO tblPlayerNames (PlayerName)
SELECT PlayerName
FROM vwPlayerNames;


SELECT * FROM tblPlayerNames;





