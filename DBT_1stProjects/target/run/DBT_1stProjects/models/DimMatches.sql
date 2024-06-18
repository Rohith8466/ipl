
  
    

        create or replace transient table DBT.dbt_rchittipolu.DimMatches
         as
        (-- models/dim_matches.sql



SELECT
    MatchID as MatchID,
    Season as Season,
    MatchDate as MatchDate,
    VenueID as VenueID,
    TossWinnerID as TossWinnerID,
    TossDecision as TossDecision,
    Result as Result,
    WinMargin as WinMargin
FROM DBT.DBT_RCHITTIPOLU.raw_matches
        );
      
  