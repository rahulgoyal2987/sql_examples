select sum(amount), customer_id, first(event_time) from transactions
where month(event_time) = 1 and year(event_time) = 2025
group by customer_id
having sum(amount) > 10
