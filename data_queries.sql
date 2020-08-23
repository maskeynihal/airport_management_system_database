INSERT INTO
  public.airlines (name)
VALUES
  ('Lion Air'),
  ('Rose Air'),
  ('Gateway Flights'),
  ('Cesna 120'),
  ('Cesna 200'),
  ('Piper'),
  ('Beechcraft Baron'),
  ('Tigress Freight Air'),
  ('Mandrigal Air'),
  ('Sacks Air');

INSERT INTO
  public.airports (name)
VALUES
  ('Liverpool John Lennon'),
  ('Glasgow'),
  ('Highland Airport'),
  ('Shannon'),
  ('Le Touquet'),
  ('Lydd'),
  ('Ramsey'),
  ('Manchester');

-- insert air crafts (aeroplane name)
INSERT INTO
  public.air_crafts (air_craft_name, airline_id, air_craft_type)
VALUES
  ('LA3456', 1, 'passenger'),
  ('LA3467', 1, 'passenger'),
  ('RA877', 2, 'passenger'),
  ('RA999', 2, 'passenger'),
  ('GF456', 3, 'passenger'),
  ('C786', 4, 'private'),
  ('C900', 5, 'private'),
  ('P090', 6, 'private'),
  ('BB987', 7, 'private'),
  ('TFA876', 8, 'freight'),
  ('MA112', 9, 'freight'),
  ('SA123', 10, 'freight'),
  ('SA872', 10, 'freight'),
  ('GF509', 3, 'freight');

INSERT INTO
  public.routes (
    air_craft_id,
    origin_airport_id,
    destination_airport_id
  )
VALUES
  (1, 1, 1),
  (1, 2, 2),
  (2, 2, 2),
  (2, 3, 3),
  (3, 4, 4),
  (4, 1, 1),
  (5, 5, 5),
  (6, 5, 5),
  (7, 5, 5),
  (8, 6, 6),
  (9, 4, 4),
  (10, 4, 4),
  (11, 7, 7),
  (12, 4, 4),
  (13, 8, 8),
  (14, 8, 8);

INSERT INTO
  public.customers (
    name,
    address,
    sex,
    nationality,
    date_of_birth,
    passport_number
  )
VALUES
  (
    'Chaz Smith',
    '56 Ireton Towers, West,
Street, Southwark, SE1 Y4',
    'Male',
    'Irish',
    '1977-09-15',
    '67891233'
  ),
  (
    'Sadiq Khan',
    '2 Jamaica Road Southwark
SE1, 9C',
    'Male',
    'French',
    '1978-03-07',
    '42342323'
  ),
  (
    'Pretti Patel',
    '88 May Street,
Saxmunden, Suffolk, SX1
8TT',
    'Female',
    'British',
    '1980-01-06',
    '85423111'
  ),
  (
    'Sadiq Khan',
    '2 Jamaica Road Southwark
SE1, 9C',
    'Male',
    'French',
    '1978-03-07',
    '42342323'
  ),
  (
    'Chaz Smith',
    '56 Ireton Towers, West,
Street, Southwark, SE1 Y4',
    'Male',
    'Irish',
    '1977-09-15',
    '67891233'
  );

INSERT INTO
  public.pilots(name)
VALUES
  ('Jane Henderson'),
  ('Alice Sprigg'),
  ('Dave Carr'),
  ('Morris Beckman');

INSERT INTO
  public.flights(
    flight_type,
    air_craft_id,
    pilot_id
  )
VALUES
  ('passenger', 1, NULL,),
  ('passenger', 2, NULL),
  ('passenger', 3, NULL),
  ('passenger', 4, NULL),
  ('passenger', 5, NULL),
  ('private', 6, 1),
  ('private', 7, 2),
  ('private', 8, 3),
  ('private', 9, 4),
  ('freight', 10, NULL),
  ('freight', 11, NULL),
  ('freight', 12, NULL),
  ('freight', 13, NULL),
  ('freight', 14, NULL);

INSERT INTO
  public.flight_details(
    flight_id,
    date_of_departure,
    time_of_departure,
    date_of_arrival,
    time_of_arrival
  )
VALUES
  (1, '2016-03-01', '9:30', '2016-03-01', '10:30'),
  (1, '2016-03-01', '10:50', '2016-03-01', '11:50'),
  (2, '2016-03-03', '17:00', '2016-03-03', '18:00'),
  (2, '2016-03-03', '17:00', '2016-03-03', '18:00'),
  (3, '2016-03-03', '18:00', '2016-03-03', '20:00'),
  (4, '2016-04-21', '10:15', '2016-04-21', '11:15'),
  (5, '2016-04-22', '11:00', '2016-04-22', '11:45'),
  (6, '2016-01-01', '9:23', '2016-01-01', '9:23'),
  (7, '2016-01-03', '9:18', '2016-01-03', '9:18'),
  (8, '2016-03-01', '10:27', '2016-03-01', '10:27'),
  (9, '2016-03-02', '16:00', '2016-03-02', '16:00'),
  (10, '2016-03-02', '9:30', '2016-03-02', '11:30'),
  (11, '2016-03-05', '17:00', '2016-03-05', '18:00'),
  (12, '2016-03-13', '18:00', '2016-03-13', '20:00'),
  (13, '2016-03-22', '10:15', '2016-03-22', '11:00'),
  (14, '2016-04-22', '11:00', '2016-04-22', '11:45');

INSERT INTO
  public.flight_route(flight_id, route_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (2, 4),
  (3, 5),
  (4, 6),
  (5, 7),
  (6, 8),
  (7, 9),
  (8, 10),
  (9, 11),
  (10, 12),
  (11, 13),
  (12, 14),
  (13, 15),
  (14, 16);

INSERT INTO
  public.freight_flight_details(flight_id, freight_type)
VALUES
  (10, 'Medical Supplies'),
  (10, 'Documents'),
  (11, 'Documents'),
  (12, 'Medical Supplies'),
  (13, 'Office Equipment Supplies'),
  (13, 'Documents'),
  (14, 'Office Equipment Supplies');

INSERT INTO
  public.passengers(passenger_id, customer_id, flight_id)
VALUES
  ('P9200', 1, 1),
  ('P9908', 2, 1),
  ('P8675', 9, 1),
  ('P8711', 10, 1),
  ('P7650', 11, 1);

INSERT INTO
  public.passenger_baggages(passenger_id, baggage_label)
VALUES
  ('P9200', 'B980'),
  ('P9200', 'B981'),
  ('P9908', 'B982'),
  ('P8675', NULL),
  ('P8711', NULL),
  ('P7650', 'B983'),
  ('P7650', 'B984');

INSERT INTO
  public.passenger_status(
    is_baggage_checked,
    is_passenger_checked_in,
    passenger_id
  )
VALUES
  (TRUE, false, 'P9200'),
  (TRUE, TRUE, 'P9908'),
  (false, false, 'P8675'),
  (false, false, 'P8711'),
  (TRUE, TRUE, 'P7650');