
  
    

        create or replace transient table DBT.dbt_rchittipolu.stg_raw_players
         as
        (-- models/staging/stg_raw_players.sql



SELECT
    md5(cast(coalesce(cast(PlayerName as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(Ball as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) AS PlayerID,  -- Generate surrogate key from PlayerName and Ball
    PlayerName,
    'India' AS Nationality,  -- Static assignment
    CASE WHEN MOD(CAST(RANDOM() * 100 AS INT), 2) = 0 THEN 'Batsman' ELSE 'Bowler' END AS PlayerRole, -- Randomly assign roles
    CASE WHEN MOD(CAST(RANDOM() * 100 AS INT), 2) = 0 THEN 'Right-hand bat' ELSE 'Left-hand bat' END AS BattingStyle, -- Randomly assign batting style
    CASE WHEN MOD(CAST(RANDOM() * 100 AS INT), 2) = 0 THEN 'Spin' ELSE 'Fast' END AS BowlingStyle -- Randomly assign bowling style
FROM (
    SELECT DISTINCT
        Striker AS PlayerName,
        Ball
    FROM DBT.dbt_rchittipolu.ipl
) AS players
        );
      
  