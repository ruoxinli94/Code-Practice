#use lead and lag to find the consecutive number

Create table cinema (seat_id int primary key , free bit)
Truncate table cinema
insert into cinema (seat_id, free) values ('1', '1')
insert into cinema (seat_id, free) values ('2', '0')
insert into cinema (seat_id, free) values ('3', '1')
insert into cinema (seat_id, free) values ('4', '1')
insert into cinema (seat_id, free) values ('5', '1')

select seat_id
from (
SELECT seat_id, free, lead(free) over(order by seat_id asc) as lead, lag(free) over(order by seat_id asc) as lag FROM
cinema) tbl
where (free=lead or free = lag) and free =1
