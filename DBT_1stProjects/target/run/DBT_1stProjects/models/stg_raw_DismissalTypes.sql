
  
    

        create or replace transient table DBT.dbt_rchittipolu.stg_raw_DismissalTypes
         as
        (-- models/staging/stg_raw_dismissal_types.sql



SELECT
    md5(cast(coalesce(cast(Wicket_type as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) AS Wicket_typeID,  -- Generate a surrogate key for each dismissal type
    Wicket_type
FROM (
    SELECT DISTINCT Wicket_type
    FROM DBT.dbt_rchittipolu.ipl
    WHERE Wicket_type IS NOT NULL AND Wicket_type != 'Not Out'
) AS unique_dismissal_types
        );
      
  