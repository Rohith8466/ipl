-- models/dim_players.sql



SELECT
    PlayerID as PlayerID,
    PlayerName as PlayerName,
    PlayerRole as PlayerRole,
    BattingStyle as BattingStyle,
    BowlingStyle as BowlingStyle,
    Nationality as Nationality
FROM DBT.DBT_RCHITTIPOLU.raw_players