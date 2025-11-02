
CREATE TABLE netflixtable (
    show_id SERIAL PRIMARY KEY,
    type VARCHAR(50),
    title VARCHAR(50),
    director VARCHAR(50),
    "cast" VARCHAR(255),
    country VARCHAR(100),
    date_added VARCHAR(50),
    release_year INT,
    rating VARCHAR(50),
    duration VARCHAR(50),
    listed_in VARCHAR(255)
);

