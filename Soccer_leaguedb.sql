-- Table: Goals
CREATE TABLE Goals (
    goal_id int  NOT NULL,
    player_id int  NOT NULL,
    match_id int  NOT NULL,
    CONSTRAINT Goals_pk PRIMARY KEY (goal_id)
);

-- Table: Matchs
CREATE TABLE Matchs (
    match_id int  NOT NULL,
    home_team_id int  NOT NULL,
    away_team_id int  NOT NULL,
    match_date date  NOT NULL,
    referee_id int  NOT NULL,
    home_team_score int  NOT NULL,
    away_team_score int  NOT NULL,
    Goals_goal_id int  NOT NULL,
    CONSTRAINT Matchs_pk PRIMARY KEY (match_id)
);

-- Table: Standings
CREATE TABLE Standings (
    standing_id int  NOT NULL,
    season_id int  NOT NULL,
    team_id int  NOT NULL,
    rank int  NOT NULL,
    points int  NOT NULL,
    wins int  NOT NULL,
    draws int  NOT NULL,
    losses int  NOT NULL,
    season_season_id int  NOT NULL,
    CONSTRAINT Standings_pk PRIMARY KEY (standing_id)
);

-- Table: players
CREATE TABLE players (
    player_id int  NOT NULL,
    first_name text  NOT NULL,
    last_name text  NOT NULL,
    date_of_birth date  NOT NULL,
    team_id int  NOT NULL,
    Goals_goal_id int  NOT NULL,
    CONSTRAINT players_pk PRIMARY KEY (player_id)
);

-- Table: referee's
CREATE TABLE referee's (
    r_id int  NOT NULL,
    first_name text  NOT NULL,
    last_name text  NOT NULL,
    country text  NOT NULL,
    Matchs_match_id int  NOT NULL,
    CONSTRAINT referee's_pk PRIMARY KEY (r_id)
);

-- Table: season
CREATE TABLE season (
    season_id int  NOT NULL,
    season_name text  NOT NULL,
    start_date date  NOT NULL,
    end_date date  NOT NULL,
    CONSTRAINT season_pk PRIMARY KEY (season_id)
);

-- Table: teams
CREATE TABLE teams (
    team_id int  NULL,
    team_name text  NOT NULL,
    city text  NOT NULL,
    state text  NOT NULL,
    country text  NOT NULL,
    coach_name text  NOT NULL,
    stadium_name text  NOT NULL,
    Standings_standing_id int  NOT NULL,
    Matchs_match_id int  NOT NULL,
    players_player_id int  NOT NULL
);

-- foreign keys
-- Reference: Matchs_Goals (table: Matchs)
ALTER TABLE Matchs ADD CONSTRAINT Matchs_Goals FOREIGN KEY Matchs_Goals (Goals_goal_id)
    REFERENCES Goals (goal_id);

-- Reference: Standings_season (table: Standings)
ALTER TABLE Standings ADD CONSTRAINT Standings_season FOREIGN KEY Standings_season (season_season_id)
    REFERENCES season (season_id);

-- Reference: players_Goals (table: players)
ALTER TABLE players ADD CONSTRAINT players_Goals FOREIGN KEY players_Goals (Goals_goal_id)
    REFERENCES Goals (goal_id);

-- Reference: referee's_Matchs (table: referee's)
ALTER TABLE referee's ADD CONSTRAINT referee's_Matchs FOREIGN KEY referee's_Matchs (Matchs_match_id)
    REFERENCES Matchs (match_id);