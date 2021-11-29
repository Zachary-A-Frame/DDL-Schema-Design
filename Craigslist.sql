CREATE TABLE "Regions" (
    "id" int   NOT NULL,
    "name" string   NOT NULL,
    CONSTRAINT "pk_Regions" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Categories" (
    "id" int   NOT NULL,
    "name" string   NOT NULL,
    CONSTRAINT "pk_Categories" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Posts" (
    "id" int   NOT NULL,
    "title" text   NOT NULL,
    "text" text   NOT NULL,
    "location" text   NOT NULL,
    "user_id" int   NOT NULL,
    "region_id" int   NOT NULL,
    "category_id" int   NOT NULL,
    CONSTRAINT "pk_Posts" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Users" (
    "id" int   NOT NULL,
    "username" varchar(25)   NOT NULL,
    "encrypted_password" string   NOT NULL,
    "preferred_region_id" int   NOT NULL,
    CONSTRAINT "pk_Users" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_user_id" FOREIGN KEY("user_id")
REFERENCES "Users" ("id");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_region_id" FOREIGN KEY("region_id")
REFERENCES "Regions" ("id");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_category_id" FOREIGN KEY("category_id")
REFERENCES "Categories" ("id");

ALTER TABLE "Users" ADD CONSTRAINT "fk_Users_preferred_region_id" FOREIGN KEY("preferred_region_id")
REFERENCES "Regions" ("id");

