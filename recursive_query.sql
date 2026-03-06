/*
id, e_name, manager_id
1, 'ram', 2
2, 'shyam', 3
3, 'sita', null
*/
create or replace temp view emp as
select id, e_name, manager_id from values (1, 'ram', 2),
(2, 'shyam', 3),
(3, 'sita', null) as t(id, e_name, manager_id);

with recursive emp1(id, e_name, level)  as
(
  select id, e_name, 1 as level from emp where manager_id is null
  union all
  select e1.id as id, e1.e_name as e_name, level + 1 
  from emp e1 join emp1 e2 on e1.manager_id = e2.id
)
select * from emp1