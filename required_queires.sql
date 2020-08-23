-- WRITE a query that selects ALL the passengers FOR flight LA3456
SELECT
  c.*,
  p.passenger_id,
  a.air_craft_name
FROM
  passengers AS p
  JOIN customers AS c ON c.customer_id = p.customer_id
  JOIN flights AS f ON p.flight_id = f.flight_id
  JOIN air_crafts AS a ON a.air_craft_id = f.air_craft_id
WHERE
  a.air_craft_name = 'LA3456';

-- WRITE a query that selects the flights carrying medical supplies
SELECT
  a.air_craft_name AS flights_carrying_medical_supplies
FROM
  freight_flight_details AS ff
  JOIN flights AS f ON f.flight_id = ff.flight_id
  JOIN air_crafts AS a ON f.air_craft_id = a.air_craft_id
WHERE
  ff.freight_type = 'Medical Supplies';

-- WRITE a query that selects ALL the passengers who have NOT checked IN baggage FOR flight LA3456.
SELECT
  c.*,
  p.passenger_id,
  a.air_craft_name,
  ps.*
FROM
  passengers AS p
  JOIN passenger_status AS ps ON ps.passenger_id = p.passenger_id
  JOIN customers AS c ON c.customer_id = p.customer_id
  JOIN flights AS f ON p.flight_id = f.flight_id
  JOIN air_crafts AS a ON a.air_craft_id = f.air_craft_id
WHERE
  a.air_craft_name = 'LA3456'
  AND ps.is_baggage_checked = false;

-- WRITE a query that shows ALL flights going TO Shannon.
-- using subqueries
SELECT
  air_craft_name
FROM
  air_crafts
WHERE
  air_craft_id IN (
    SELECT
      air_craft_id
    FROM
      routes
    WHERE
      destination_airport_id IN (
        SELECT
          airport_id
        FROM
          airports
        WHERE
          name = 'Shannon'
      )
  );

-- using join
SELECT
  ac.air_craft_name AS flights_going_to_shannon
FROM
  airports AS a
  JOIN routes AS r ON a.airport_id = r.destination_airport_id
  JOIN air_crafts AS ac ON r.air_craft_id = ac.air_craft_id
WHERE
  a.name = 'Shannon';

-- WRITE a query that counts the number of flights IN March 2016.
SELECT
  DISTINCT count(flight_id)
FROM
  flight_details AS fd
WHERE
  fd.date_of_departure >= '2016-03-01'
  AND fd.date_of_departure < '2016-04-01';

-- Update the records for flight GF456 to a new departure time of 18.00 and a
-- corresponding new arrival time given that the flight duration is the same.
WITH aircraft_flight_details AS(
  SELECT
    ac.air_craft_name,
    ac.air_craft_id,
    f.flight_id,
    fd.date_of_departure,
    fd.date_of_arrival,
    fd.time_of_departure,
    fd.time_of_arrival
  FROM
    air_crafts AS ac
    JOIN flights AS f ON f.air_craft_id = ac.air_craft_id
    JOIN flight_details AS fd ON fd.flight_id = f.flight_id
)
UPDATE
  flight_details AS fd
SET
  time_of_departure = '19:00' :: time,
  time_of_arrival = '18:00' :: time + aircraft_flight_details.time_of_arrival :: INTERVAL - aircraft_flight_details.time_of_departure :: INTERVAL
FROM
  aircraft_flight_details
WHERE
  fd.flight_id = (
    SELECT
      flight_id
    FROM
      aircraft_flight_details
    WHERE
      aircraft_flight_details.air_craft_name = 'GF456'
  );

-- UPDATE
--   the records FOR private flight C786 so that the pilot IS NOW listed AS ‘ Paul Stow ’.
INSERT INTO
  pilots (name)
VALUES
  ('Paul Stow');

WITH aircraft_flight_details AS(
  SELECT
    ac.air_craft_name,
    ac.air_craft_id,
    f.flight_id,
    p.name,
    fd.date_of_departure,
    fd.date_of_arrival,
    fd.time_of_departure,
    fd.time_of_arrival
  FROM
    air_crafts AS ac
    JOIN flights AS f ON f.air_craft_id = ac.air_craft_id
    JOIN flight_details AS fd ON fd.flight_id = f.flight_id
    JOIN pilots AS p ON f.pilot_id = p.pilot_id
)
UPDATE
  flights AS f
SET
  pilot_id = (
    SELECT
      pilot_id
    FROM
      pilots
    WHERE
      name = 'Paul Stow'
  )
FROM
  aircraft_flight_details
WHERE
  f.flight_id = (
    SELECT
      flight_id
    FROM
      aircraft_flight_details
    WHERE
      aircraft_flight_details.air_craft_name = 'C786'
  );

-- UPDATE
--   ALL flights IN January 2016 that have a destination of Le Touquet so that they NOW are going TO Lydd.
INSERT INTO
  public.routes (
    air_craft_id,
    origin_airport_id,
    destination_airport_id
  )
VALUES
  (6, 6, 6),
  (7, 6, 6);

UPDATE
  flight_route
SET
  route_id = 6
WHERE
  flight_id IN (
    SELECT
      fd.flight_id
    FROM
      flight_details AS fd
      JOIN flights AS f ON f.flight_id = fd.flight_id
      JOIN flight_route AS fr ON fr.flight_id = f.flight_id
      JOIN routes AS r ON r.route_id = fr.route_id
      JOIN air_crafts AS ac ON ac.air_craft_id = f.air_craft_id
      JOIN airports AS a ON a.airport_id = r.destination_airport_id
    WHERE
      fd.date_of_departure >= '2016-01-01'
      AND fd.date_of_departure < '2016-02-01'
      AND a.name = 'Le Touquet'
  );

-- UPDATE
--   flight_route
-- SET
--   route_id = 7
-- WHERE
--   flight_id = (
--     SELECT
--       flights.flight_id
--     FROM
--       flights
--       JOIN flight_route ON flight_route.flight_id = flights.flight_id
--     WHERE
--       flights.air_craft_id = 7
--   );
-- UPDATE
--   the record FOR Chaz Smithso that his nationality IS NOW listed AS French.
UPDATE
  customers
SET
  nationality = 'French'
WHERE
  name = 'Chaz Smith';

SELECT
  name,
  nationality
FROM
  customers;

-- DELETE ALL private flights FOR the date of 03 January 2016
--  deletes if has cascade
DELETE FROM
  flights
WHERE
  flights.flight_id = (
    SELECT
      f.flight_id
    FROM
      flights AS f
      JOIN flight_details AS fd ON fd.flight_id = f.flight_id
    WHERE
      f.flight_type = 'private'
      AND fd.date_of_departure = '2016-01-03'
  );