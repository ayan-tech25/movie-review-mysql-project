-- create a user table

use movie_review_system;

create table users(
     user_id  INT PRIMARY KEY AUTO_INCREMENT,
     user_name varchar(30) not null,
     eamil varchar(50) not null unique,
     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

------------------------------------------------------------------
-- create a movie table

create table movie(
        movie_id  INT PRIMARY KEY AUTO_INCREMENT,
	tital varchar(30) not null,
	genre varchar(30) not null,
        release_year YEAR not null,
        language varchar(30) not null,
        duration INT not null,
        description TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
--------------------------------------------------------------------

-- create table watchlist

 create table watchlist(
    warchlist_id int primary key auto_increment,
    user_id INT NOT NULL, 
    movie_id INT NOT NULL,
    status ENUM('pending' , 'watched') NOT NULL DEFAULT 'PENDING', 
    added_date date not null DEFAULT (CURRENT_DATE),
    watched_date DATE ,
 
 
    constraint fk_watchlist_user
    foreign  key (u_id) references users(u_id)
    ON UPDATE CASCADE ON DELETE CASCADE,

    constraint fk_watchlist_movie
    foreign key( m_id )references movie(m_id) 
     ON UPDATE CASCADE ON DELETE CASCADE,
    
     CONSTRAINT uq_user_movie
     UNIQUE(user_id, movie_id)
);

-------------------------------------------------------------------------

-- create table review
 
create table review(
	review_id INT PRIMARY KEY AUTO_INCREMENT,
    	watchlist_id int not null,
       rating INT NOT NULL,
        review_text varchar(500),
        review_date DATE NOT NULL DEFAULT (CURRENT_DATE),

 constraint fk_reviews_watchlist
    foreign  key (watchlist_id) references watchlist(watchlist_id)
    ON UPDATE CASCADE ON DELETE CASCADE,

   

 CONSTRAINT chk_rating
     CHECK (rating BETWEEN 1 AND 5)
);

        
	


	

       