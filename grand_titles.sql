select p.player_name, (sum(case 
when p.player_id = c.wimbledon then 1 else 0 end) +
sum(case when p.player_id = c.fr_open then 1 else 0 end) +
sum(case when p.player_id = c.us_open then 1 else 0 end) + 
sum(case when p.player_id = c.au_open then 1 else 0 end)) as grand_titles from
players p join championship c on p.player_id = c.wimbledon or p.player_id = c.fr_open or p.player_id = c.us_open or p.player_id = c.au_open
group by p.player_name
