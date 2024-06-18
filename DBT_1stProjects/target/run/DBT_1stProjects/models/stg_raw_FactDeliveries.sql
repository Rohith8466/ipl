
  
    

        create or replace transient table DBT.dbt_rchittipolu.stg_raw_FactDeliveries
         as
        (-- models/fact_deliveries.sql



SELECT
    md5(cast(coalesce(cast(Venue as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(Innings as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(Ball as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(BatsmanID as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(BowlerID as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) AS DeliveryID,  -- Creating a unique identifier for each delivery
    MatchDate,
    Venue,
    Innings,
    Ball,
    BatsmanID,
    BowlerID,
    Runs_Off_Bat AS RunsScored,
    Extras,
    Dismissal_Type,
    (CASE WHEN Dismissal_Type IS NOT NULL AND Dismissal_Type != 'Not Out' THEN 1 ELSE 0 END) AS Is_Wicket,
    DBT.dbt_rchittipolu.stg_raw_players.PlayerID AS BatsmanID,  -- Linking Batsman to Player dimension
    DBT.dbt_rchittipolu.stg_raw_players.PlayerID AS BowlerID,   -- Linking Bowler to Player dimension
    DBT.dbt_rchittipolu.stg_raw_teams.TeamID AS BattingTeamID,  -- Linking Batting Team
    DBT.dbt_rchittipolu.stg_raw_teams.TeamID AS BowlingTeamID,  -- Linking Bowling Team
    DBT.dbt_rchittipolu.stg_raw_DismissalTypes.DismissalTypeID  -- Linking Dismissal Type
FROM DBT.dbt_rchittipolu.ipl
LEFT JOIN DBT.dbt_rchittipolu.stg_raw_players p1 ON i.BatsmanID = p1.PlayerName
LEFT JOIN DBT.dbt_rchittipolu.stg_raw_players p2 ON i.BowlerID = p2.PlayerName
LEFT JOIN DBT.dbt_rchittipolu.stg_raw_teams t1 ON i.Batting_Team = t1.TeamName
LEFT JOIN DBT.dbt_rchittipolu.stg_raw_teams t2 ON i.Bowling_Team = t2.TeamNameLEFT JOIN DBT.dbt_rchittipolu.stg_raw_DismissalTypes ON DBT.dbt_rchittipolu.ipl.Dismissal_Type = DBT.dbt_rchittipolu.stg_raw_DismissalTypes.Dismissal_Type
        );
      
  