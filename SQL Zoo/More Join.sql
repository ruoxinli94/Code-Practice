/*6.
Obtain the cast list for 'Casablanca'.

what is a cast list?
The cast list is the names of the actors who were in the movie.

Use movieid=11768, (or whatever value you got from the previous question)
*/
select a.name 
from movie m join 
casting c on m.id = c.movieid join 
actor a on c.actorid = a.id
where m.id = 11768

/*7.
Obtain the cast list for the film 'Alien'
*/
select a.name 
from movie m join 
casting c on m.id = c.movieid join 
actor a on c.actorid = a.id
where m.title = 'Alien'

/*8.
List the films in which 'Harrison Ford' has appeared
*/
select m.title
from movie m join 
casting c on m.id = c.movieid join 
actor a on c.actorid = a.id
where a.name =  'Harrison Ford' 

/*9.
List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of
the actor. If ord=1 then this actor is in the starring role]
*/
select m.title
from movie m join 
casting c on m.id = c.movieid join 
actor a on c.actorid = a.id
where a.name =  'Harrison Ford' and c.ord != 1

/*10.
List the films together with the leading star for all 1962 films.
*/
select m.title, a.name
from movie m join 
casting c on m.id = c.movieid join 
actor a on c.actorid = a.id
where m.yr = 1962 and c.ord = 1

/*11.
Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made
more than 2 movies.
*/
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

/*12.
List the film title and the leading actor for all of the films 'Julie Andrews' played in.
*/
select m.title, a.name from casting c 
join movie m on c.movieid = m.id
join actor a on a.id = c.actorid
where movieid in (
SELECT movieid FROM casting
WHERE actorid IN (
  SELECT id FROM actor
  WHERE name='Julie Andrews')) and c.ord = 1

/*13.
Obtain a list, in alphabetical order, of actors who've had at least 30 starring roles.
*/
select name from actor
where id in (
select actorid from (select * from casting where ord = 1) star
group by actorid
having count(*)>=30)


/*14.
List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
*/
select title, n from (
select m.title title, count(actorid) n, m.yr yr from 
movie m join casting c on c.movieid = m.id
group by m.title, m.yr
) temp
where yr = 1978 
order by n desc, title


/*15.
List all the people who have worked with 'Art Garfunkel'.
*/
select distinct a.name from actor a
join casting c on c.actorid = a.id
where movieid in (
select movieid from casting 
where actorid in (select id from actor where name ='Art Garfunkel')
) and a.name != 'Art Garfunkel'
