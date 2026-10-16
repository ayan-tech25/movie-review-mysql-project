use movie_review_system;
select w.watchlist_id, u.user_name, m.title
from
watchlist w 
INNER JOIN
users u
ON u.user_id = w.user_id

INNER JOIN
movies m
on m.movie_id = w.movie_id ;

select m.movie_id, m.title, w.watchlist_id
from 
movies m
left join
watchlist w
on m.movie_id = w.movie_id ;


select u.user_name, m.title, r.rating, r.review_text
from
reviews r
INNER JOIN
watchlist w 
on r.watchlist_id = w.watchlist_id
inner join
movies m
on m.movie_id = w.movie_id

inner join
users u
on u.user_id = w.user_id;

select u.user_name, m.title
from
watchlist w
inner join
movies m
on w. movie_id = m.movie_id

inner join
users u 
on w.user_id = u.user_id
where w.status = "pending" ; 
