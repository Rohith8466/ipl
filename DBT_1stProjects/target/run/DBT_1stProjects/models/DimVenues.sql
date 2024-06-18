
  
    

        create or replace transient table DBT.dbt_rchittipolu.DimVenues
         as
        (-- models/dim_venues.sql



SELECT
    VenueID as VenueID,
    VenueName as VenueName,
    City as City
FROM DBT.DBT_RCHITTIPOLU.raw_venues
        );
      
  