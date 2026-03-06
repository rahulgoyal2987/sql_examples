 select tab.a, tab.b, ntile(2) OVER (PARTITION BY tab.a ORDER BY tab.b) as percent FROM VALUES 
 ('A1', 2),
 ('A1', 4)
 , ('A1', 1)
 , ('A2', 3),
  ('A1', 1) as tab(a, b);