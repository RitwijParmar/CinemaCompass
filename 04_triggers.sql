-- Triggers for the CinemaCompass Database

-- This function checks if the travel distance is non-negative.
CREATE OR REPLACE FUNCTION check_travel_distance()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.Distance < 0 THEN
        RAISE EXCEPTION 'Travel distance cannot be negative. Transaction is being rolled back.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- This trigger calls the check_travel_distance function before inserting a new travel path.
CREATE TRIGGER before_travel_path_insert
BEFORE INSERT ON TravelPaths
FOR EACH ROW
EXECUTE FUNCTION check_travel_distance();# This trigger ensures valid data before insertion
