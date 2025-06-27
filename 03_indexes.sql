-- Indexes to improve query performance on the CinemaCompass database.

-- Index for searching showtimes by movie title
CREATE INDEX idx_showtimes_movie ON showtimes(movie);

-- Index for searching travel paths by user location and distance
CREATE INDEX idx_travelpaths_user_dist ON travel_paths(user_loc, distance);

-- Index for improving aggregation performance on the pricing table
CREATE INDEX idx_pricing_showID ON pricing(showID);# Indexes were created on foreign keys and frequently queried columns
