-- Adminer 4.7.7 PostgreSQL dump

DROP TABLE IF EXISTS "category";
CREATE TABLE "public"."category" (
    "category_id" integer NOT NULL,
    "sport_id" integer NOT NULL,
    "category_gender" character varying NOT NULL,
    "category_type_of_age" character varying NOT NULL,
    "category_weight" integer NOT NULL,
    CONSTRAINT "category_pk" PRIMARY KEY ("category_id"),
    CONSTRAINT "category_fk" FOREIGN KEY (sport_id) REFERENCES type_of_sport(sport_id) NOT DEFERRABLE
) WITH (oids = false);

TRUNCATE "category";

DROP TABLE IF EXISTS "club";
CREATE TABLE "public"."club" (
    "club_id" integer NOT NULL,
    "club_responsible_person" character varying NOT NULL,
    "club_name" character varying NOT NULL,
    "club_year_of_establish" date NOT NULL,
    "club_email" character varying NOT NULL,
    "club_password" character varying NOT NULL,
    "club_country" character varying NOT NULL,
    "club_city" character varying NOT NULL,
    "club_number" character varying NOT NULL,
    CONSTRAINT "club_pk" PRIMARY KEY ("club_id")
) WITH (oids = false);

TRUNCATE "club";

DROP TABLE IF EXISTS "competition";
CREATE TABLE "public"."competition" (
    "competition_id" integer NOT NULL,
    "competition_place" character varying NOT NULL,
    "sport_id" integer NOT NULL,
    "competition_start_date" date NOT NULL,
    "competition_end_date" date NOT NULL,
    "competition_application_start" date NOT NULL,
    "competition_application_end" date NOT NULL,
    "club_id" integer NOT NULL,
    CONSTRAINT "competition_pk" PRIMARY KEY ("competition_id"),
    CONSTRAINT "competition_fk" FOREIGN KEY (club_id) REFERENCES club(club_id) NOT DEFERRABLE,
    CONSTRAINT "competition_fk2" FOREIGN KEY (sport_id) REFERENCES type_of_sport(sport_id) NOT DEFERRABLE
) WITH (oids = false);

TRUNCATE "competition";

DROP TABLE IF EXISTS "competition_competitors";
CREATE TABLE "public"."competition_competitors" (
    "competition_id" integer NOT NULL,
    "competitor_id" integer NOT NULL,
    "category_id" integer NOT NULL,
    CONSTRAINT "competition_competitors_pk" PRIMARY KEY ("competition_id", "competitor_id", "category_id"),
    CONSTRAINT "competition_competitors_fk" FOREIGN KEY (competition_id) REFERENCES competition(competition_id) NOT DEFERRABLE,
    CONSTRAINT "competition_competitors_fk2" FOREIGN KEY (competitor_id) REFERENCES competitor(competitor_id) NOT DEFERRABLE,
    CONSTRAINT "competition_competitors_fk3" FOREIGN KEY (category_id) REFERENCES category(category_id) NOT DEFERRABLE
) WITH (oids = false);

TRUNCATE "competition_competitors";

DROP TABLE IF EXISTS "competitor";
CREATE TABLE "public"."competitor" (
    "competitor_id" integer NOT NULL,
    "club_id" integer NOT NULL,
    "competitor_name" character varying NOT NULL,
    "competitor_gender" character varying NOT NULL,
    "competitor_birthday" date NOT NULL,
    "sport_id" integer NOT NULL,
    CONSTRAINT "competitor_pk" PRIMARY KEY ("competitor_id"),
    CONSTRAINT "competitor_fk" FOREIGN KEY (club_id) REFERENCES club(club_id) NOT DEFERRABLE
) WITH (oids = false);

TRUNCATE "competitor";

DROP TABLE IF EXISTS "competitor_sport";
CREATE TABLE "public"."competitor_sport" (
    "sport_id" integer NOT NULL,
    "competitor_id" integer NOT NULL,
    CONSTRAINT "competitor_sport_pk" PRIMARY KEY ("sport_id", "competitor_id"),
    CONSTRAINT "competitor_sport_fk" FOREIGN KEY (competitor_id) REFERENCES competitor(competitor_id) NOT DEFERRABLE,
    CONSTRAINT "competitor_sport_fk2" FOREIGN KEY (sport_id) REFERENCES type_of_sport(sport_id) NOT DEFERRABLE
) WITH (oids = false);

TRUNCATE "competitor_sport";

DROP TABLE IF EXISTS "type_of_sport";
CREATE TABLE "public"."type_of_sport" (
    "sport_id" integer NOT NULL,
    "sport_name" character varying NOT NULL,
    CONSTRAINT "type_of_sport_pk" PRIMARY KEY ("sport_id")
) WITH (oids = false);

TRUNCATE "type_of_sport";

-- 2020-07-25 09:41:36.741806+00
