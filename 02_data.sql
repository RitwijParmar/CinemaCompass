-- Sample Data for the CinemaCompass Database

-- Users
INSERT INTO Users (UserID, age, search_radius, location) VALUES
(1, 30, 10000, '42.8864,-78.8784'),
(2, 12, 5000, '42.9047,-78.8494'),
(3, 70, 15000, '42.8882,-78.8781');

-- PersonType
INSERT INTO PersonType (Age, UserType) VALUES
(12, 'Child'),
(30, 'Adult'),
(70, 'Senior');

-- Theaters
INSERT INTO Theaters (TheaterName, PhoneNumber, Email, OpenStreetMapID, GIS_coordinates, TotalScreens) VALUES
('Regal Elmwood Center', '844-462-7342', 'contact@regal.com', 'way/12345', '42.9367,-78.8763', 16),
('AMC Market Arcade 8', '716-854-2045', 'contact@amc.com', 'way/67890', '42.8837,-78.8732', 8);

-- TheaterAmenities
INSERT INTO TheaterAmenities (TheaterName, isHearingAccessible, isWheelchairAccessible) VALUES
('Regal Elmwood Center', TRUE, TRUE),
('AMC Market Arcade 8', TRUE, FALSE);

-- Movies
INSERT INTO Movies (title, runtime, RottenTomatoesRating, AgeRating, IMDB_link, IMDB_ID) VALUES
('Black Bag (2025)', 120, 85, 'R', 'http://imdb.com/title/tt123', 'tt123'),
('Mickey 17 (2025)', 135, 78, 'PG-13', 'http://imdb.com/title/tt456', 'tt456');

-- CastMember
INSERT INTO CastMember (Name, Role, MovieID) VALUES
('Cate Blanchett', 'Main Character', 'tt123'),
('Robert Pattinson', 'Mickey', 'tt456');

-- Showtimes
INSERT INTO Showtimes (ShowtimeID, TheaterName, MovieID, start_time, ScreenNumber) VALUES
(1, 'Regal Elmwood Center', 'tt123', '07:10 PM', 9),
(2, 'AMC Market Arcade 8', 'tt456', '08:00 PM', 3);

-- Pricing
INSERT INTO Pricing (ShowtimeID, SeatType, UserType, Price) VALUES
(1, 'Standard', 'Adult', 15.50),
(1, 'Standard', 'Child', 12.00),
(2, 'Luxury', 'Adult', 22.00);

-- Bookings
INSERT INTO Bookings (ShowtimeID, TicketsRemaining, Price) VALUES
(1, 150, 15.50),
(2, 50, 22.00);

-- TravelPaths
INSERT INTO TravelPaths (UserLocation, TheaterLocation, TravelPath, Distance, Time) VALUES
('42.8864,-78.8784', '42.9367,-78.8763', 'Sample Path Data', 5600, 15),
('42.9047,-78.8494', '42.8837,-78.8732', 'Sample Path Data 2', 3200, 10);