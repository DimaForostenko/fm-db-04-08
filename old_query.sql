create extension "uuid-ossp";
DROP TABLE "users";

CREATE TABLE "users"(
    id SERIAL PRIMARY KEY, 
    first_name VARCHAR(44) NOT NULL CHECK(first_name!= ''),
    last_name VARCHAR(32) NOT NULL CHECK(last_name!= ''),
    email VARCHAR(256) NOT NULL CHECK(email != '') UNIQUE,
    is_male BOOLEAN NOT NULL,
    birthday DATE NOT NULL CHECK (birthday < CURRENT_DATE),
    height NUMERIC(3,2) CHECK (height > 1.2 AND height < 2.5) 
);

INSERT INTO "users"(first_name,last_name,email,is_male,birthday,height)

VALUES 
('Elon','Musk','msk@gamil.com',TRUE,'1971-06-26',1.88),
('Elon','Musk','muk@gamil.com',TRUE,'1971-06-26',1.28),
('Elon','Musk','mussk@gamil.com',TRUE,'1971-06-26',1.88),
('Elon','Musk','muskk@gamil.com',TRUE,'1971-06-26',1.88),
('Elon','Musk','muusk@gamil.com',TRUE,'1271-06-26',2.08);


DROP TABLE "message";

CREATE TABLE "message"(
    "id" BIGSERIAL PRIMARY KEY,
    "body" VARCHAR(2028) NOT NULL CHECK("body" !=''),
    "author" VARCHAR(256) NOT NULL CHECK("author" !=''),
    "createAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isRead" BOOLEAN NOT NULL DEFAULT FALSE
);

INSERT INTO "message"("author","body")

VALUES
('Tim Cooc','Hello World'),
('Tim Loop','Hello World'),
('Tim Li','Hello World');
