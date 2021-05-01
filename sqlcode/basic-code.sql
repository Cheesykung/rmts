--To Delete all row in table
--In mySQL workbrench you need to disable save mode before run this code
--To disable save mode goto (Home -> Edit -> Preferences -> SQL Editor -> <scoll to the bottom> Save Updates)
delete from `table_name`;

--To Delete row
delete from `table_name`
where id = 0;

--To set Auto Increment (auto gen ID) = 1
alter table `table_name` auto_increment = 1;

--To Insert row
--In mySQL workbrench you need to input the database name before table name like this
insert into `database_name`.`table_name` (`column_name`,`column_name2`) --Can input more column
VALUES (`value_col1`, `value_col2`),
(`value2_col1`, `value2_col2`);

--To update value in table
update `table_name`
set `column_name` = `value`
where `condition`;