/* #5
Execute the self join shown and observe that b.stop gives all the places you can get to from Craiglockhart, without changing routes. 
Change the query so that it shows the services from Craiglockhart to London Road.*/

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 and b.stop = 149


/*#6.
The query shown is similar to the previous one, however by joining two copies of the stops table we can refer to stops by name rather
than by number. Change the query so that the services between 'Craiglockhart' and 'London Road' are shown. If you are tired of these
places try 'Fairmilehead' against 'Tollcross'
*/
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and stopb.name = 'London Road'


/*7.
Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')
*/
select distinct a.company,a.num
from route a join route b on (a.company = b.company and a.num = b.num)
where a.stop = 115 and b.stop = 137


/*8.
Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'
*/
select distinct a.company, a.num
from route a join route b on (a.num = b.num and a.company = b.company)
join stops sa on a.stop = sa.id
join stops sb on b.stop = sb.id
where sa.name = 'Craiglockhart' and sb.name = 'Tollcross'


/*9.
Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, including 'Craiglockhart' itself, offered
by the LRT company. Include the company and bus no. of the relevant services.
*/
select distinct sb.name, a.company, a.num
from route a join route b on (a.num = b.num and a.company = b.company)
join stops sa on a.stop = sa.id
join stops sb on b.stop = sb.id
where sa.name = 'Craiglockhart'

/*10.
Find the routes involving two buses that can go from Craiglockhart to Lochend.
Show the bus no. and company for the first bus, the name of the stop for the transfer,
and the bus no. and company for the second bus.
*/
SELECT DISTINCT a.num, a.company, stpb.name, c.num, c.company
FROM route a JOIN route b 
ON (a.num = b.num AND a.company = b.company)
JOIN (route c JOIN route d ON (c.num = d.num and c.company = d.company))
                               JOIN stops stpa on stpa.id = a.stop 
                               JOIN stops stpb on stpb.id = b.stop 
                               JOIN stops stpc on stpc.id = c.stop 
                               JOIN stops stpd on stpd.id = d.stop 
where stpd.name = 'Lochend' and stpa.name = 'Craiglockhart' and stpb.name = stpc.name
                              



