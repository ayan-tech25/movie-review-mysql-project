-- Select the database
USE movie_review_system;

-- 1. Create users table
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Create movies table
CREATE TABLE movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(30) NOT NULL,
    release_year YEAR NOT NULL,
    language VARCHAR(30) NOT NULL,
    duration INT NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Create watchlist table
CREATE TABLE watchlist (
    watchlist_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    movie_id INT NOT NULL,
    status ENUM('pending', 'watched') NOT NULL DEFAULT 'pending',
    added_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    watched_date DATE,

    CONSTRAINT fk_watchlist_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_watchlist_movie
        FOREIGN KEY (movie_id)
        REFERENCES movies(movie_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT uq_watchlist_user_movie
        UNIQUE (user_id, movie_id)
);

-- 4. Create reviews table
CREATE TABLE reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    watchlist_id INT NOT NULL,
    rating INT NOT NULL,
    review_text VARCHAR(500),
    review_date DATE NOT NULL DEFAULT (CURRENT_DATE),

    CONSTRAINT fk_reviews_watchlist
        FOREIGN KEY (watchlist_id)
        REFERENCES watchlist(watchlist_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT chk_reviews_rating
        CHECK (rating BETWEEN 1 AND 5),

    CONSTRAINT uq_reviews_watchlist
        UNIQUE (watchlist_id)
);