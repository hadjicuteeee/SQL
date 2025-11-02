use project2;
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    City VARCHAR(50)
);

INSERT INTO Users (UserID, Name, Email, City) VALUES
(101, 'Alice Smith', 'alice@email.com', 'New York'),
(102, 'Bob Jones', 'bob@email.com', 'Chicago'),
(103, 'Carol Lee', 'carol@email.com', 'San Francisco'),
(104, 'David Kim', 'david@email.com', 'Boston'),
(105, 'Eva Torres', 'eva@email.com', 'Miami'),
(106, 'Frank White', 'frank@email.com', 'Seattle'),
(107, 'Grace Park', 'grace@email.com', 'Austin'),
(108, 'Henry Liu', 'henry@email.com', 'Denver'),
(109, 'Isla Martinez', 'isla@email.com', 'Atlanta'),
(110, 'Jack Wilson', 'jack@email.com', 'Dallas');

CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(100),
    Genre VARCHAR(50),
    ReleaseYear INT,
    DurationMin INT
);

INSERT INTO Movies (MovieID, Title, Genre, ReleaseYear, DurationMin) VALUES
(1, 'Nightcrawler', 'Thriller', 2014, 117),
(2, 'Se7en', 'Crime', 1995, 127),
(3, 'Gone Girl', 'Thriller', 2014, 149),
(4, 'Shutter Island', 'Thriller', 2010, 138),
(5, 'The Silence of the Lambs', 'Crime', 1991, 118),
(6, 'Prisoners', 'Thriller', 2013, 153),
(7, 'Zodiac', 'Thriller', 2007, 157),
(8, 'Fight Club', 'Drama', 1999, 139),
(9, 'Parasite', 'Thriller', 2019, 132),
(10, 'Us', 'Horror', 2019, 116);


CREATE TABLE ViewingHistory (
    HistoryID INT PRIMARY KEY,
    UserID INT,
    MovieID INT,
    WatchDate DATE,
    WatchDurationMinutes INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);

INSERT INTO ViewingHistory (HistoryID, UserID, MovieID, WatchDate, WatchDurationMinutes) VALUES
(1, 101, 1, '2025-08-01', 117),
(2, 101, 3, '2025-08-03', 149),
(3, 101, 6, '2025-08-05', 153),
(4, 102, 2, '2025-08-02', 127),
(5, 102, 4, '2025-08-04', 138),
(6, 102, 7, '2025-08-07', 157),
(7, 103, 1, '2025-08-01', 117),
(8, 103, 5, '2025-08-03', 118),
(9, 103, 9, '2025-08-06', 132),
(10, 104, 10, '2025-08-02', 116),
(11, 104, 3, '2025-08-05', 149),
(12, 105, 4, '2025-08-01', 138),
(13, 105, 6, '2025-08-04', 153),
(14, 105, 1, '2025-08-07', 117),
(15, 106, 2, '2025-08-02', 127),
(16, 106, 7, '2025-08-05', 157),
(17, 107, 5, '2025-08-03', 118),
(18, 107, 9, '2025-08-06', 132),
(19, 107, 10, '2025-08-08', 116),
(20, 108, 1, '2025-08-01', 117),
(21, 108, 3, '2025-08-04', 149),
(22, 108, 6, '2025-08-07', 153),
(23, 109, 2, '2025-08-02', 127),
(24, 109, 4, '2025-08-05', 138),
(25, 110, 7, '2025-08-03', 157),
(26, 110, 9, '2025-08-06', 132),
(27, 110, 10, '2025-08-08', 116),
(28, 105, 2, '2025-08-09', 127),
(29, 106, 3, '2025-08-10', 149),
(30, 104, 5, '2025-08-11', 118);
