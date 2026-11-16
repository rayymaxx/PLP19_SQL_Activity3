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

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    passenger_id INT NOT NULL,
    class_tier VARCHAR(20) NOT NULL,
    seat_preference VARCHAR(30),
    lounge_pass_code VARCHAR(50),    
    suite_number VARCHAR(10),            
    chauffeur_service BOOLEAN DEFAULT FALSE, 

    CONSTRAINT fk_bookings_passenger
        FOREIGN KEY (passenger_id) REFERENCES passengers (passenger_id),
    CONSTRAINT chk_class_tier
        CHECK (class_tier IN ('Economy', 'Business', 'First'))
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

SELECT passenger_id, name, current_location, destination, travel_date
FROM passengers;

SELECT booking_id, passenger_id, class_tier, seat_preference,
       lounge_pass_code, suite_number, chauffeur_service
FROM bookings;


SELECT DISTINCT
    p.passenger_id,
    p.name,
    p.current_location,
    p.destination,
    p.travel_date,
    b.class_tier
FROM passengers AS p
INNER JOIN bookings AS b
    ON p.passenger_id = b.passenger_id
WHERE b.class_tier IN ('Business', 'First');

SELECT
    p.name AS name,
    p.destination AS destination,
    b.class_tier AS tier,
    b.seat_preference AS seat_preference,
    b.lounge_pass_code AS lounge_pass_code,
    b.suite_number AS suite_number,
    b.chauffeur_service AS chauffeur_service,
    CASE
        WHEN b.class_tier = 'Business' THEN 100 
        ELSE 20         
    END AS weight_allowance_kg
FROM passengers AS p
INNER JOIN bookings AS b
    ON p.passenger_id = b.passenger_id
ORDER BY p.passenger_id;

