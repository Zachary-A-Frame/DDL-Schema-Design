CREATE TABLE "Teams" (
    "id" int   NOT NULL,
    "name" string   NOT NULL,
    "city" string   NOT NULL,
    CONSTRAINT "pk_Teams" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Players" (
    "id" int   NOT NULL,
    "name" string   NOT NULL,
    "birthday" date   NOT NULL,
    "height" string   NOT NULL,
    "current_team_id" int   NOT NULL,
    CONSTRAINT "pk_Players" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Goals" (
    "id" int   NOT NULL,
    "player_id" int   NOT NULL,
    "match_id" int   NOT NULL,
    CONSTRAINT "pk_Goals" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Referees" (
    "id" int   NOT NULL,
    "name" string   NOT NULL,
    CONSTRAINT "pk_Referees" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Results" (
    "id" int   NOT NULL,
    "team_id" int   NOT NULL,
    "match_id" int   NOT NULL,
    "result_win_loss_draw" varchar(5)   NOT NULL,
    CONSTRAINT "pk_Results" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Matches" (
    "id" int   NOT NULL,
    "home_team_id" int   NOT NULL,
    "away_team_id" int   NOT NULL,
    "location" string   NOT NULL,
    "date" date   NOT NULL,
    "start_time" time   NOT NULL,
    "season_id" int   NOT NULL,
    "head_referee_id" int   NOT NULL,
    "assistant_referee_id" int   NOT NULL,
    CONSTRAINT "pk_Matches" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Lineups" (
    "id" int   NOT NULL,
    "player_id" int   NOT NULL,
    "Match_id" int   NOT NULL,
    "team_id" int   NOT NULL,
    CONSTRAINT "pk_Lineups" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Season" (
    "id" int   NOT NULL,
    "start_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    CONSTRAINT "pk_Season" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Players" ADD CONSTRAINT "fk_Players_current_team_id" FOREIGN KEY("current_team_id")
REFERENCES "Teams" ("id");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_player_id" FOREIGN KEY("player_id")
REFERENCES "Players" ("id");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_match_id" FOREIGN KEY("match_id")
REFERENCES "Matches" ("id");

ALTER TABLE "Results" ADD CONSTRAINT "fk_Results_team_id" FOREIGN KEY("team_id")
REFERENCES "Teams" ("id");

ALTER TABLE "Results" ADD CONSTRAINT "fk_Results_match_id" FOREIGN KEY("match_id")
REFERENCES "Matches" ("id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_home_team_id" FOREIGN KEY("home_team_id")
REFERENCES "Teams" ("id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_away_team_id" FOREIGN KEY("away_team_id")
REFERENCES "Teams" ("id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_season_id" FOREIGN KEY("season_id")
REFERENCES "Season" ("id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_head_referee_id" FOREIGN KEY("head_referee_id")
REFERENCES "Referees" ("id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_assistant_referee_id" FOREIGN KEY("assistant_referee_id")
REFERENCES "Referees" ("id");

ALTER TABLE "Lineups" ADD CONSTRAINT "fk_Lineups_player_id" FOREIGN KEY("player_id")
REFERENCES "Players" ("id");

ALTER TABLE "Lineups" ADD CONSTRAINT "fk_Lineups_Match_id" FOREIGN KEY("Match_id")
REFERENCES "Matches" ("id");

ALTER TABLE "Lineups" ADD CONSTRAINT "fk_Lineups_team_id" FOREIGN KEY("team_id")
REFERENCES "Teams" ("id");

