-- ==========================================================
-- V1__init.sql
-- Concert Booking Database Schema + Sample Data
-- ==========================================================

-- =========================
-- TABLES
-- =========================

CREATE TABLE concerts (
                          id VARCHAR(50) PRIMARY KEY,
                          name VARCHAR(255) NOT NULL,
                          venue VARCHAR(255) NOT NULL,
                          type VARCHAR(100) NOT NULL,
                          price DECIMAL(10,2) NOT NULL,
                          is_premium BOOLEAN NOT NULL
);

CREATE TABLE customers (
                           id VARCHAR(50) PRIMARY KEY,
                           full_name VARCHAR(255) NOT NULL,
                           address VARCHAR(255),
                           email VARCHAR(255) NOT NULL,
                           status VARCHAR(50) NOT NULL
);

CREATE TABLE showtimes (
                           id VARCHAR(50) PRIMARY KEY,
                           date DATE NOT NULL,
                           time TIME NOT NULL,
                           concert_id VARCHAR(50),
                           CONSTRAINT fk_showtime_concert
                               FOREIGN KEY (concert_id) REFERENCES concerts(id)
);

CREATE TABLE reservations (
                              id VARCHAR(50) PRIMARY KEY,
                              customer_id VARCHAR(50) NOT NULL,
                              concert_id VARCHAR(50) NOT NULL,
                              showtime_id VARCHAR(50) NOT NULL,
                              status VARCHAR(50) NOT NULL,

                              CONSTRAINT fk_res_customer FOREIGN KEY (customer_id) REFERENCES customers(id),
                              CONSTRAINT fk_res_concert FOREIGN KEY (concert_id) REFERENCES concerts(id),
                              CONSTRAINT fk_res_showtime FOREIGN KEY (showtime_id) REFERENCES showtimes(id)
);

-- =========================
-- SAMPLE DATA
-- =========================

-- CONCERTS
INSERT INTO concerts VALUES
                         ('C1', 'Rock Night', 'Bell Centre', 'ROCK', 120.00, TRUE),
                         ('C2', 'Jazz Evening', 'Place des Arts', 'JAZZ', 80.00, FALSE),
                         ('C3', 'Pop Festival', 'Olympic Stadium', 'POP', 150.00, TRUE);

-- CUSTOMERS
INSERT INTO customers VALUES
                          ('U1', 'John Doe', 'Montreal', 'john@example.com', 'ACTIVE'),
                          ('U2', 'Jane Smith', 'Laval', 'jane@example.com', 'ACTIVE'),
                          ('U3', 'Mike Brown', 'Quebec City', 'mike@example.com', 'ACTIVE');

-- SHOWTIMES
-- IMPORTANT: No overlapping venue conflicts

INSERT INTO showtimes VALUES
                          ('S1', '2026-06-01', '18:00:00', 'C1'), -- Bell Centre
                          ('S2', '2026-06-01', '21:00:00', 'C1'), -- Bell Centre (OK: different time)
                          ('S3', '2026-06-01', '19:00:00', 'C2'), -- Place des Arts
                          ('S4', '2026-06-02', '20:00:00', 'C3'); -- Olympic Stadium

-- RESERVATIONS
-- IMPORTANT:
-- - No customer booked twice at same time
-- - All reservations valid

INSERT INTO reservations VALUES
                             ('R1', 'U1', 'C1', 'S1', 'ACTIVE'),
                             ('R2', 'U2', 'C2', 'S3', 'ACTIVE'),
                             ('R3', 'U3', 'C3', 'S4', 'ACTIVE');

-- =========================
-- OPTIONAL CONSTRAINTS (ADVANCED)
-- =========================

-- Prevent duplicate reservation for same customer + showtime
-- (helps enforce rule #1)

ALTER TABLE reservations
    ADD CONSTRAINT unique_customer_showtime UNIQUE (customer_id, showtime_id);