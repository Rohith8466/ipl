
  
    

        create or replace transient table DBT.dbt_rchittipolu.dim_players_scd_type_2
         as
        (-- models/dim_players_scd_type_2.sql



WITH source_data AS (
    SELECT
        PlayerID,
        PlayerName,
        PlayerRole,
        BattingStyle,
        BowlingStyle,
        Nationality,
        current_timestamp() AS updated_at 
    FROM DBT.dbt_rchittipolu.stg_raw_players  
),

scd_updates AS (
    SELECT
        s.PlayerID,
        s.PlayerName,
        s.PlayerRole,
        s.BattingStyle,
        s.BowlingStyle,
        s.Nationality,
        s.updated_at,
        COALESCE(p.effective_date, current_date()) AS effective_date,
        NULL::date AS expiration_date,
        'DBT.dbt_rchittipolu.dim_players_scd_type_2' || s.PlayerID || current_date() AS player_version_id
    FROM source_data s
    LEFT JOIN DBT.dbt_rchittipolu.dim_players_scd_type_2 p ON s.PlayerID = p.PlayerID AND p.expiration_date IS NULL
    WHERE p.PlayerID IS NULL
        OR s.PlayerRole != p.PlayerRole
        OR s.BattingStyle != p.BattingStyle
        OR s.BowlingStyle != p.BowlingStyle
        OR s.Nationality != p.Nationality
)
        );
      
  