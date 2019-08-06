create table users(id int primary key, json text);
insert into users values(1, '{"has": ["A", "B"]}');
insert into users values(2, '{"has": ["C"]}');
insert into users values(3, '{"has": []}');
select json_each.value from users, json_each(json_extract(users.json, '$.has'));
