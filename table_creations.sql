CREATE TABLE "customers" (
  "id" serial,
  "customer_id" serial PRIMARY KEY,
  "name" varchar NOT NULL,
  "address" varchar NOT NULL,
  "sex" varchar,
  "nationality" varchar NOT NULL,
  "date_of_birth" date NOT NULL,
  "passport_number" varchar NOT NULL
);

CREATE TABLE "passengers" (
  "id" serial,
  "passenger_id" varchar PRIMARY KEY,
  "customer_id" integer,
  "flight_id" integer,
);

CREATE TABLE "passenger_baggages" (
  "passenger_id" varchar,
  "baggage_label" varchar
);

CREATE TABLE "passenger_status" (
  "id" serial,
  "passenger_id" varchar,
  "is_baggage_checked" boolean DEFAULT false,
  "is_passenger_checked_in" boolean DEFAULT false
);

CREATE TABLE "airlines" (
  "id" serial,
  "airline_id" serial PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "air_crafts" (
  "id" serial,
  "air_craft_id" serial PRIMARY KEY,
  "air_craft_type" varchar DEFAULT 'passenger',
  "air_craft_name" VARCHAR NOT NULL UNIQUE,
  "airline_id" integer
);

CREATE TABLE "airports" (
  "id" serial,
  "airport_id" serial PRIMARY KEY,
  "name" varchar UNIQUE NOT NULL
);

CREATE TABLE "pilots" (
  "id" serial,
  "pilot_id" serial PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "routes" (
  "id" serial,
  "route_id" serial PRIMARY KEY,
  "air_craft_id" integer,
  "origin_airport_id" integer,
  "destination_airport_id" integer
);

CREATE TABLE "flights" (
  "id" serial,
  "flight_id" serial PRIMARY KEY,
  "flight_type" varchar,
  "air_craft_id" integer,
  "pilot_id" integer DEFAULT NULL,
);

CREATE TABLE "flight_details" (
  "flight_id" integer,
  "date_of_departure" date NOT NULL,
  "time_of_departure" time NOT NULL,
  "date_of_arrival" date NOT NULL,
  "time_of_arrival" time
);

CREATE TABLE "freight_flight_details" (
  "id" serial,
  "flight_id" integer,
  "freight_type" varchar NOT NULL
);

CREATE TABLE "flight_route" ("flight_id" integer, "route_id" integer);

ALTER TABLE
  "passengers"
ADD
  FOREIGN KEY ("customer_id") REFERENCES "customers" ("customer_id");

ALTER TABLE
  "passengers"
ADD
  FOREIGN KEY ("flight_id") REFERENCES "flights" ("flight_id");

ALTER TABLE
  "passenger_status"
ADD
  FOREIGN KEY ("passenger_id") REFERENCES "passengers" ("passenger_id");

ALTER TABLE
  "passenger_baggages"
ADD
  FOREIGN KEY ("passenger_id") REFERENCES "passengers" ("passenger_id");

ALTER TABLE
  "air_crafts"
ADD
  FOREIGN KEY ("airline_id") REFERENCES "airlines" ("airline_id");

ALTER TABLE
  "routes"
ADD
  FOREIGN KEY ("air_craft_id") REFERENCES "air_crafts" ("air_craft_id");

ALTER TABLE
  "routes"
ADD
  FOREIGN KEY ("origin_airport_id") REFERENCES "airports" ("airport_id");

ALTER TABLE
  "routes"
ADD
  FOREIGN KEY ("destination_airport_id") REFERENCES "airports" ("airport_id");

ALTER TABLE
  "flights"
ADD
  FOREIGN KEY ("air_craft_id") REFERENCES "air_crafts" ("air_craft_id");

ALTER TABLE
  "flights"
ADD
  FOREIGN KEY ("pilot_id") REFERENCES "pilots" ("pilot_id");

ALTER TABLE
  "freight_flight_details"
ADD
  FOREIGN KEY ("flight_id") REFERENCES "flights" ("flight_id");

ALTER TABLE
  "flight_route"
ADD
  FOREIGN KEY ("flight_id") REFERENCES "flights" ("flight_id");

ALTER TABLE
  "flight_details"
ADD
  FOREIGN KEY ("flight_id") REFERENCES "flights" ("flight_id");

ALTER TABLE
  "flight_route"
ADD
  FOREIGN KEY ("route_id") REFERENCES "routes" ("route_id");