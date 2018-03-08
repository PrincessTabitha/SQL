select * from customer
order by state;

select * from customer
where state = 'CA';
select concat('$', FORMAT (sum(sales), 2)) as 'Total Sales' from customer
 where state ='CA';
select state, concat('$', FORMAT (sum(sales), 2)) as 'State Sales'
from customer
group  by state;