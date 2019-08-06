create table users(id int primary key, json text);
insert into users values(1, '{"has": [[1, 2], ["A", "B"]]}');
insert into users values(2, '{"has": [[3], ["C"]]}');
insert into users values(3, '{"has": []}');
--select json_each.value from users, json_each(json_extract(users.json, '$.has[1]'));
select json_group_array(value) from (select json_each.value from users, json_each(json_extract(users.json, '$.has[1]')));
