-- Sample queries for the CinemaCompass Database

-- Query 1: Find all showtimes for a specific movie, ordered by start time.
-- This query benefits from the 'idx_showtimes_movie' index.
EXPLAIN (ANALYZE, BUFFERS)
SELECT
    showID,
    theater,
    to_timestamp(showtime, 'HH12:MI pm')::time AS start_time
FROM showtimes
WHERE movie = 'Black Bag (2025)'
ORDER BY start_time;


-- Query 2: Find all theaters within a certain distance of a user's location.
-- This query benefits from the 'idx_travelpaths_user_dist' index.
EXPLAIN (ANALYZE, BUFFERS)
SELECT t.name, p.distance
FROM travel_paths p
JOIN theaters t ON p.theater_loc = t.coordinates
WHERE p.user_loc = '-17.897963,87.183467'
    AND p.distance <= 50000
ORDER BY p.distance;


-- Query 3: Find the top 10 showtimes with the highest average ticket price.
-- This query benefits from the 'idx_pricing_showID' index.
EXPLAIN (ANALYZE, BUFFERS)
SELECT p.showID, AVG(p.price) AS avg_price
FROM pricing p
GROUP BY p.showID
ORDER BY avg_price DESC
LIMIT 10;


-- Example of an INSERT statement that returns the new ShowtimeID
INSERT INTO "Showtimes" ("TheaterName", "Movie", "StartTime", "ScreenNumber", "ShowtimeID")
VALUES ('AMC 34th Street 14', 'Mickey 17 (2025)', '7:10 pm', 9, DEFAULT)
RETURNING "ShowtimeID" as newID;