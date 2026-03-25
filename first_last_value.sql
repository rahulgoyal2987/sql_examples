
SELECT
  user_id,
  event_time,
  event_type,
  LAST_VALUE(CASE WHEN event_type='purchase' THEN event_time END, true) OVER (
    PARTITION BY user_id
    ORDER BY event_time
    ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING
  ) AS prev_purchase_time,
  FIRST_VALUE(CASE WHEN event_type='purchase' THEN event_time END, true) OVER (
    PARTITION BY user_id
    ORDER BY event_time
    ROWS BETWEEN 1 FOLLOWING AND UNBOUNDED FOLLOWING
  ) AS next_purchase_time
FROM values (1,'2026-03-24','login'),(1,'2026-03-25','purchase'),
(1,'2026-03-26','logout'),(1,'2026-03-27','purchase') user_events(user_id, event_time, event_type);
