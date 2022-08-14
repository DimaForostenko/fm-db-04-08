

CREATE TABLE "teams"(
  "id" BIGSERIAL PRIMARY KEY ,
  "name" VARCHAR(64) NOT NULL CHECK("name"!='')

  );

CREATE TABLE "coaches"(
  "id" BIGSERIAL PRIMARY KEY ,
  "name" VARCHAR(64) NOT NULL CHECK("name"!=''),
  "teamId" BIGINT REFERENCES "teams"("id")

  );

  ALTER TABLE "teams"
  ADD COLUMN "coachId" BIGINT REFERENCES "coaches"
