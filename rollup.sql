select sum(amount), coalesce(cast(customer_id as string), 'All customers') customer_id,
coalesce(event_time) from transactions
where month(event_time) = 1 and year(event_time) = 2025
group by rollup (customer_id, event_time)
having sum(amount) > 10