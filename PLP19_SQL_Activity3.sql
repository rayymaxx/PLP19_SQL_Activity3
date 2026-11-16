-- checks if the database exists first
DROP DATABASE IF EXISTS airline_db;
CREATE DATABASE airline_db;
USE airline_db;

CREATE TABLE passengers (
    passenger_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    current_location VARCHAR(100),
    destination VARCHAR(100),
    travel_date VARCHAR(20)
);

INSERT INTO passengers (passenger_id, name, current_location, destination, travel_date)
VALUES
    (1, 'Miriam Meles', 'Kigali', 'London', '2026-12-10'),
    (2, 'Raymond Otieno', 'Nairobi', 'Dubai', '2026-12-15'),
    (3, 'Felix Akpu', 'Lagos', 'Paris', '2026-12-20');

INSERT INTO bookings
    (booking_id, passenger_id, class_tier, seat_preference,
     lounge_pass_code, suite_number, chauffeur_service)
VALUES
    (10, 1, 'First', 'Window', 'LP001', 'Suite 1', TRUE),
    (20, 2, 'Business', 'Aisle', 'LP002', NULL, FALSE),
    (30, 3, 'Economy', 'Window', NULL, NULL, FALSE);
    