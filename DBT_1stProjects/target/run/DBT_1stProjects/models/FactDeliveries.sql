
  
    

        create or replace transient table DBT.dbt_rchittipolu.FactDeliveries
         as
        (-- models/fact_deliveries.sql



SELECT
    DeliveryID as DeliveryID,
    MatchID as MatchID,
    Innings as Innings,
    Over as Over,
    Ball as Ball,
    BatsmanID as BatsmanID,
    BowlerID as BowlerID,
    RunsScored as RunsScored,
    ExtraRuns as ExtraRuns,
    DismissalTypeID as DismissalTypeID,
    DismissalFielderID as DismissalFielderID
FROM DBT.DBT_RCHITTIPOLU.raw_deliveries
        );
      
  