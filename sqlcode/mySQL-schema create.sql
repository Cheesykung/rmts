-- << Before use this code! >>
-- use need to download MySQL Workbench 8.0 CE
-- install then create database with the same name `rmts`
-- if you don't know how then use the forrowing guildline (https://github.com/it-web-pro/WEEK01-setup/blob/main/windows10/README.md)

-- CREATE TABLE `rmts`.`stations` (
--   `station_id` int(11) AUTO_INCREMENT,
--   `station_line` int(11) default NULL,
--   `station_name` varchar(300) NOT NULL,
--   `transit` boolean NOT NULL DEFAULT 0,
--   `type` enum('ARL', 'SRT', 'BTS', 'MRT') NOT NULL,
--   PRIMARY KEY (`station_id`)
-- );

-- create table `rmts`.`bts` (
-- 	`station_id` int(11),
-- 	`station_zone` int(11) default 0,
--  `station_codename` varchar(30),
--   primary key (`station_id`),
--   foreign key (`station_id`) references stations(`station_id`)
-- );

-- create table `rmts`.`arl` (
-- 	`station_id` int(11),
--     `station_codename` varchar(30),
--   primary key (`station_id`),
--     foreign key (`station_id`) references stations(`station_id`)
-- );

-- create table `rmts`.`mrt`(
-- 	`station_id` int(11),
--     `station_codename` varchar(30),
--    primary key (`station_id`),
--     foreign key (`station_id`) references stations(`station_id`)
-- );

-- create table `rmts`.`srt`(
-- 	`station_id` int(11),
--     `station_zone` int(11) default 0,
--     `used_time` int(11) default 0,
--    primary key (`station_id`),
--     foreign key (`station_id`) references stations(`station_id`)
-- );

-- create table `rmts`.`train_srt`(
-- 	`train_id` int(11) AUTO_INCREMENT,
--     `train_type` enum('normal', 'fast', 'sp_fast', 'suburb') default 'normal',
--     `departure` datetime not null default 0,
--     `station_id` int(11) not null,
--     primary key (`train_id`),
--     foreign key (`station_id`) references srt(`station_id`)
-- );

-- create table `rmts`.`srt_train_srt`(
-- 	`station_id` int(11) not null,
--     `train_id` int(11) not null,
--      primary key (`station_id`),
--      primary key (`train_id`),
--     foreign key (`station_id`) references srt(`station_id`),
--     foreign key (`train_id`) references train_srt(`train_id`)
-- );

-- create table `rmts`.`before_next` (
--   `before3` int(11),
--   `before2` int(11),
--   `before1` int(11),
--   `station_id` int(11),
--   `next1` int(11),
--   `next2` int(11),
--   `next3` int(11),
--   primary key (`station_id`),
--   foreign key (`before1`) references stations(`station_id`),
--   foreign key (`before2`) references stations(`station_id`),
--   foreign key (`before3`) references stations(`station_id`),
--   foreign key (`station_id`) references stations(`station_id`),
-- 	foreign key (`next1`) references stations(`station_id`),
-- 	foreign key (`next2`) references stations(`station_id`),
-- 	foreign key (`next3`) references stations(`station_id`)
-- )