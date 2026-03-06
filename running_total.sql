select event_time, sum(amount) over (order by event_time 
rows between unbounded preceding and current row)  as total_amount
from (select event_time, sum(amount) amount from transactions
group by event_time)