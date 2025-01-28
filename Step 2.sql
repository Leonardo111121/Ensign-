-- Script: EC_IT143_W4.2_hello_world_s2_ls.sql
-- Step 2: Begin creating an answer
-- Focus: Start mapping out the journey to find the answer.

-- Question from Step 1: What are the names of all players in the database?

-- Current step: Add more details about the players by including their positions.
-- Logical next step: Join the Player table with the Position table to map players to their positions.

SELECT 
    pl_name AS PlayerName,
    p_name AS PositionName
FROM 
    [tblPlayerDim] 
INNER JOIN 
    tblPositionDim
ON 
   tblPlayerDim.p_id=tblPositionDim.p_id


