
  
    

        create or replace transient table DBT.dbt_rchittipolu.DimTeams
         as
        (-- models/dim_teams.sql



SELECT
    TeamID as TeamID,
    TeamName as TeamName
FROM DBT.DBT_RCHITTIPOLU.raw_teams
        );
      
  