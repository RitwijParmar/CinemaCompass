-- Schema for the CinemaCompass Database

-- Table to store user information
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    age INT,
    search_radius INT,
    location VARCHAR(255)
);

-- Table for person types based on age, used for pricing
CREATE TABLE PersonType (
    Age INT PRIMARY KEY,
    UserType VARCHAR(50)
);

-- Table to store theater information
CREATE TABLE Theaters (
    TheaterName VARCHAR(255) PRIMARY KEY,
    PhoneNumber VARCHAR(20),
    Email VARCHAR(255),
    OpenStreetMapID VARCHAR(255),
    GIS_coordinates VARCHAR(255),
    TotalScreens INT
);

-- Table for theater accessibility features
CREATE TABLE TheaterAmenities (
    TheaterName VARCHAR(255) PRIMARY KEY,
    isHearingAccessible BOOLEAN,
    isWheelchairAccessible BOOLEAN
);

-- Table to store movie information
CREATE TABLE Movies (
    title VARCHAR(255) PRIMARY KEY,
    runtime INT,
    RottenTomatoesRating INT,
    AgeRating VARCHAR(10),
    IMDB_link VARCHAR(255),
    IMDB_ID VARCHAR(20)
);

-- Table to store information about cast members
CREATE TABLE CastMember (
    Name VARCHAR(255),
    Role VARCHAR(255),
    MovieID VARCHAR(20),
    PRIMARY KEY (Name, Role, MovieID)
);

-- Table for individual movie showtimes
CREATE TABLE Showtimes (
    ShowtimeID INT PRIMARY KEY,
    TheaterName VARCHAR(255),
    MovieID VARCHAR(20),
    start_time VARCHAR(20),
    ScreenNumber INT
);

-- Table for ticket pricing based on showtime, seat, and user type
CREATE TABLE Pricing (
    ShowtimeID INT,
    SeatType VARCHAR(50),
    UserType VARCHAR(50),
    Price FLOAT,
    PRIMARY KEY (ShowtimeID, SeatType, UserType)
);

-- Table for storing user bookings
CREATE TABLE Bookings (
    ShowtimeID INT PRIMARY KEY,
    TicketsRemaining INT,
    Price FLOAT
);

-- Table for calculated travel paths
CREATE TABLE TravelPaths (
    UserLocation VARCHAR(255),
    TheaterLocation VARCHAR(255),
    TravelPath TEXT,
    Distance FLOAT,
    Time FLOAT,
    PRIMARY KEY (UserLocation, TheaterLocation)
);

-- Foreign Key Constraints
ALTER TABLE TheaterAmenities ADD FOREIGN KEY (TheaterName) REFERENCES Theaters(TheaterName);
ALTER TABLE CastMember ADD FOREIGN KEY (MovieID) REFERENCES Movies(IMDB_ID);
ALTER TABLE Showtimes ADD FOREIGN KEY (TheaterName) REFERENCES Theaters(TheaterName);
ALTER TABLE Showtimes ADD FOREIGN KEY (MovieID) REFERENCES Movies(IMDB_ID);
ALTER TABLE Pricing ADD FOREIGN KEY (ShowtimeID) REFERENCES Showtimes(ShowtimeID);
ALTER TABLE Bookings ADD FOREIGN KEY (ShowtimeID) REFERENCES Showtimes(ShowtimeID);-- Foreign keys will enforce relational integrity --
