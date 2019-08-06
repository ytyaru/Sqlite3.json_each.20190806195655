create table users(id int primary key, json text);
insert into users values(1, '{"has": [[1, 2], ["A", "B"]]}');
insert into users values(2, '{"has": [[3], ["B", "C"]]}');
insert into users values(3, '{"has": []}');
.headers on
.mode column
select json_each.value as value, count(json_each.value) as count from users, json_each(json_extract(users.json, '$.has[1]')) group by json_each.value order by count desc, value asc;
