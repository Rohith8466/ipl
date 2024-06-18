-- models/staging/stg_raw_teams.sql



WITH team_names AS (
    SELECT DISTINCT Batting_Team AS TeamName,ball 
    FROM DBT.dbt_rchittipolu.ipl
)

SELECT
     md5(cast(coalesce(cast(TeamName as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(ball as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) AS TeamID ,  -- Generate a surrogate key from the team name
    TeamName
FROM team_names