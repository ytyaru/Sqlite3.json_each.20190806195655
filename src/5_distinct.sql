create table users(id int primary key, json text);
insert into users values(1, '{"has": [[1, 2], ["A", "B"]]}');
insert into users values(2, '{"has": [[3], ["A", "C"]]}');
insert into users values(3, '{"has": []}');
select distinct json_each.value from users, json_each(json_extract(users.json, '$.has[1]')) order by json_each.value desc;
