
  
    

        create or replace transient table DBT.dbt_rchittipolu.stg_raw_venues
         as
        (-- models/staging/stg_raw_venues.sql



SELECT
    md5(cast(coalesce(cast(VenueName as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) AS VenueID,  -- Generate surrogate key from VenueName
    VenueName
FROM (
    SELECT DISTINCT Venue AS VenueName
    FROM DBT.dbt_rchittipolu.ipl
) AS venues
        );
      
  