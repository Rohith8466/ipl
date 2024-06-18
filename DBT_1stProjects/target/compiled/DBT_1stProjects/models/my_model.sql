-- models/my_model.sql



-- Create Dimension Table for Players
CREATE OR REPLACE TABLE dbt_rchittipolu.DimPlayers (
    PlayerID INT PRIMARY KEY,
    PlayerName VARCHAR(255),
    PlayerRole VARCHAR(100),
    BattingStyle VARCHAR(50),
    BowlingStyle VARCHAR(50),
    Nationality VARCHAR(50)
);

-- Create Dimension Table for Teams
CREATE TABLE dbt_rchittipolu.DimTeams (
    TeamID INT PRIMARY KEY,
    TeamName VARCHAR(255)
);

-- Create Dimension Table for Venues
CREATE TABLE dbt_rchittipolu.DimVenues (
    VenueID INT PRIMARY KEY,
    VenueName VARCHAR(255),
    City VARCHAR(100)
);

-- Create Dimension Table for Dismissal Types
CREATE TABLE dbt_rchittipolu.DimDismissalTypes (
    DismissalTypeID INT PRIMARY KEY,
    DismissalType VARCHAR(100)
);

-- Create Dimension Table for Matches
CREATE TABLE dbt_rchittipolu.DimMatches (
    MatchID INT PRIMARY KEY,
    Season VARCHAR(50),
    MatchDate DATE,
    VenueID INT,
    Team1ID INT,
    Team2ID INT,
    WinnerID INT,
    TossWinnerID INT,
    TossDecision VARCHAR(50),
    Result VARCHAR(50),
    WinMargin VARCHAR(50),
    FOREIGN KEY (VenueID) REFERENCES dbt_rchittipolu.DimVenues(VenueID),
    FOREIGN KEY (Team1ID) REFERENCES dbt_rchittipolu.DimTeams(TeamID),
    FOREIGN KEY (Team2ID) REFERENCES dbt_rchittipolu.DimTeams(TeamID),
    FOREIGN KEY (WinnerID) REFERENCES dbt_rchittipolu.DimTeams(TeamID),
    FOREIGN KEY (TossWinnerID) REFERENCES dbt_rchittipolu.DimTeams(TeamID)
);

-- Create Fact Table for Deliveries
CREATE TABLE dbt_rchittipolu.FactDeliveries (
    DeliveryID INT PRIMARY KEY,
    MatchID INT,
    Innings INT,
    Over INT,
    Ball INT,
    BatsmanID INT,
    BowlerID INT,
    RunsScored INT,
    ExtraRuns INT,
    DismissalTypeID INT,
    DismissalFielderID INT,
    FOREIGN KEY (MatchID) REFERENCES dbt_rchittipolu.DimMatches(MatchID),
    FOREIGN KEY (BatsmanID) REFERENCES dbt_rchittipolu.DimPlayers(PlayerID),
    FOREIGN KEY (BowlerID) REFERENCES dbt_rchittipolu.DimPlayers(PlayerID),
    FOREIGN KEY (DismissalTypeID) REFERENCES dbt_rchittipolu.DimDismissalTypes(DismissalTypeID),
    FOREIGN KEY (DismissalFielderID) REFERENCES dbt_rchittipolu.DimPlayers(PlayerID)
);