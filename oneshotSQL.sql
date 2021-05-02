CREATE TABLE `rmts`.`stations` (
  `station_id` int(11) AUTO_INCREMENT,
  `station_line` int(11) default NULL,
  `station_name` varchar(300) NOT NULL,
  `transit` boolean NOT NULL DEFAULT 0,
  `type` enum('ARL', 'SRT', 'BTS', 'MRT') NOT NULL,
  PRIMARY KEY (`station_id`)
);

create table `rmts`.`bts` (
	`station_id` int(11),
	`station_zone` int(11) default 0,
 `station_codename` varchar(30),
  primary key (`station_id`),
  foreign key (`station_id`) references stations(`station_id`)
);

create table `rmts`.`arl` (
	`station_id` int(11),
    `station_codename` varchar(30),
  primary key (`station_id`),
    foreign key (`station_id`) references stations(`station_id`)
);

create table `rmts`.`mrt`(
	`station_id` int(11),
    `station_codename` varchar(30),
   primary key (`station_id`),
    foreign key (`station_id`) references stations(`station_id`)
);

create table `rmts`.`srt`(
	`station_id` int(11),
    `station_zone` int(11) default 0,
    `used_time` int(11) default 0,
   primary key (`station_id`),
    foreign key (`station_id`) references stations(`station_id`)
);

create table `rmts`.`before_next` (
  `before3` int(11),
  `before2` int(11),
  `before1` int(11),
  `station_id` int(11),
  `next1` int(11),
  `next2` int(11),
  `next3` int(11),
  primary key (`station_id`),
  foreign key (`before1`) references stations(`station_id`),
  foreign key (`before2`) references stations(`station_id`),
  foreign key (`before3`) references stations(`station_id`),
  foreign key (`station_id`) references stations(`station_id`),
	foreign key (`next1`) references stations(`station_id`),
	foreign key (`next2`) references stations(`station_id`),
	foreign key (`next3`) references stations(`station_id`)
);

INSERT INTO `rmts`.`stations` (`station_line`, `station_name`, `transit`, `type`) 
VALUES ('0', 'กรุงเทพ', 1, 'SRT'),
('0', 'ยมราช', 0, 'SRT'),
('0', 'โรงพยาบาลรามาธิบดี', 0, 'SRT'),
('0', 'ประดิพันธ์', 0, 'SRT'),
('0', 'สามเสน', 0, 'SRT'),
('0', 'บางซื่อ', 1, 'SRT'),
('1', 'บางซ่อน', 0, 'SRT'),
('1', 'บางบำหรุ', 0, 'SRT'),
('1', 'ตลิ่งชัน', 0, 'SRT'),
('1', 'บ้านฉิมพลิ', 0, 'SRT'),
('1', 'พุทธมณฑลสาย 2', 0, 'SRT'),
('1', 'ศาลาธรรมสพน์', 0, 'SRT'),
('1', 'ศาลายา', 0, 'SRT'),
('1', 'วัดสุวรรณ', 0, 'SRT'),
('1', 'คลองมหาสวัสดิ์', 0, 'SRT'),
('1', 'วัดงิ้วราย', 0, 'SRT'),
('1', 'นครชัยศรี', 0, 'SRT'),
('1', 'ท่าแฉลบ', 0, 'SRT'),
('1', 'ต้นสำโรง', 0, 'SRT'),
('1', 'นครปฐม', 0, 'SRT'),
('1', 'พระราชวังสนามจันทร์', 0, 'SRT'),
('1', 'โพรงมะเดื่อ', 0, 'SRT'),
('1', 'ธนบุรี', 0, 'SRT'),
('1', 'จรัญสนิทวงศ์', 0, 'SRT'),
('1', 'บางระมาด', 0, 'SRT'),
('2', 'อุรุพงศ์', 0, 'SRT'),
('2', 'พญาไท', 1, 'SRT'),
('2', 'ราชปรารภ', 0, 'SRT'),
('2', 'มักกะสัน', 0, 'SRT'),
('2', 'อโศก', 1, 'SRT'),
('2', 'คลองตัน', 0, 'SRT'),
('2', 'สุขุมวิท 71', 0, 'SRT'),
('2', 'หัวหมาก', 1, 'SRT'),
('2', 'บ้านทับช้าง', 0, 'SRT'),
('2', 'ซอยวัดลานบุญ', 0, 'SRT'),
('2', 'ลาดกระบัง', 1, 'SRT'),
('2', 'พระจอมเกล้า', 0, 'SRT'),
('2', 'หัวตะเข้', 0, 'SRT'),
('2', 'คลองหลวงเพ่ง', 0, 'SRT'),
('3', 'นิคมรถไฟ กม.11', 0, 'SRT'),
('3', 'บางเขน', 0, 'SRT'),
('3', 'ทุ่งสองห้อง', 0, 'SRT'),
('3', 'หลักสี่', 0, 'SRT'),
('3', 'การเคหะ กม.19', 0, 'SRT'),
('3', 'ตลาดใหม่ดอนเมือง', 0, 'SRT'),
('3', 'ดอนเมือง', 0, 'SRT'),
('3', 'แกรนคาแนล', 0, 'SRT'),
('3', 'หลักหก', 0, 'SRT'),
('3', 'คลองรังสิต', 0, 'SRT'),
('3', 'รังสิต', 0, 'SRT'),
('3', 'เชียงราก', 0, 'SRT'),
('3', 'มหาวิทยาลัยธรรมศาสตร์', 0, 'SRT'),
('3', 'นวลนคร', 0, 'SRT'),
('4', 'วงเวียนใหญ่', 0, 'SRT'),
('4', 'ตลาดพลู', 0, 'SRT'),
('4', 'คลองต้นไทร', 0, 'SRT'),
('4', 'จอมทอง', 0, 'SRT'),
('4', 'วัดไทร', 0, 'SRT'),
('4', 'วัดสิงห์', 0, 'SRT'),
('4', 'บางบอน', 0, 'SRT'),
('4', 'การเคหะ', 0, 'SRT'),
('4', 'รางสะแก', 0, 'SRT'),
('4', 'รางโพธิ์', 0, 'SRT'),
('4', 'สามแยก', 0, 'SRT'),
('4', 'พรมแดน', 0, 'SRT'),
('4', 'ทุ่งสีทอง', 0, 'SRT'),
('4', 'บางน้ำจืด', 0, 'SRT'),
('4', 'คอกควาย', 0, 'SRT'),
('4', 'บ้านขอม', 0, 'SRT'),
('4', 'คลองจาก', 0, 'SRT'),
('4', 'มหาชัย', 0, 'SRT'),
('5', 'บ้านแหลม', 0, 'SRT'),
('5', 'ท่าฉลอม', 0, 'SRT'),
('5', 'บ้านชีผ้าขาว', 0, 'SRT'),
('5', 'บางสีคต', 0, 'SRT'),
('5', 'บางกระเจ้า', 0, 'SRT'),
('5', 'บ้านบ่อ', 0, 'SRT'),
('5', 'บางโทรัด', 0, 'SRT'),
('5', 'บ้านกาหลง', 0, 'SRT'),
('5', 'บ้านนาขวาง', 0, 'SRT'),
('5', 'บ้านนาโคก', 0, 'SRT'),
('5', 'เขตเมือง', 0, 'SRT'),
('0', 'พญาไท', 1, 'ARL'),
('0', 'ราชปรารภ', 0, 'ARL'),
('0', 'มักกะสัน', 1, 'ARL'),
('0', 'รามคำแหง', 1, 'ARL'),
('0', 'หัวหมาก', 0, 'ARL'),
('0', 'บ้านทับช้าง', 0, 'ARL'),
('0', 'ลาดกระบัง', 1, 'ARL'),
('0', 'สุวรรณภูมิ', 0, 'ARL'),
('0', 'ท่าพระ', 0, 'MRT'),
('0', 'จรัญฯ 13', 0, 'MRT'),
('0', 'ไฟฉาย', 0, 'MRT'),
('0', 'บางขุนนท์', 0, 'MRT'),
('0', 'บางยี่ขัน', 0, 'MRT'),
('0', 'สิริธร', 0, 'MRT'),
('0', 'บางพลัด', 0, 'MRT'),
('0', 'บางอ้อ', 0, 'MRT'),
('0', 'บางโพ', 0, 'MRT'),
('0', 'เตาปูน', 1, 'MRT'),
('0', 'บางซื่อ', 1, 'MRT'),
('0', 'กำแพงเพชร', 0, 'MRT'),
('0', 'สวนจตุจักร', 1, 'MRT'),
('0', 'พหลโยธิน', 1, 'MRT'),
('0', 'ลาดพร้าว', 0, 'MRT'),
('0', 'รัชดาพิเษก', 0, 'MRT'),
('0', 'สุทธิสาร', 0, 'MRT'),
('0', 'ห้วยขวาง', 0, 'MRT'),
('0', 'ศูนย์วัฒนธรรมไทย', 0, 'MRT'),
('0', 'พระราม 9', 0, 'MRT'),
('0', 'เพชรบุรี', 1, 'MRT'),
('0', 'สุขุมวิท', 1, 'MRT'),
('0', 'ศูนย์การประชุมแห่งชาติสิริกิติ์', 0, 'MRT'),
('0', 'คลองเตย', 0, 'MRT'),
('0', 'ลุมพินี', 0, 'MRT'),
('0', 'สีลม', 1, 'MRT'),
('0', 'สามย่าน', 0, 'MRT'),
('0', 'หัวลำโพง', 1, 'MRT'),
('0', 'วัดมังกร', 0, 'MRT'),
('0', 'สามยอด', 0, 'MRT'),
('0', 'สนามไชย', 0, 'MRT'),
('0', 'อิสรภาพ', 0, 'MRT'),
('0', 'บางไผ่', 0, 'MRT'),
('0', 'บางหว้า', 0, 'MRT'),
('0', 'เพชรเกษม 48', 0, 'MRT'),
('0', 'ภาษีเจริญ', 0, 'MRT'),
('0', 'บางแค', 0, 'MRT'),
('0', 'หลักสอง', 0, 'MRT'),
('1', 'เตาปูน', 1, 'MRT'),
('1', 'บางซ่อน', 1, 'MRT'),
('1', 'วงศ์สว่าง', 0, 'MRT'),
('1', 'แยกติวานนท์', 0, 'MRT'),
('1', 'กระทรวงสาธารณะสุข', 0, 'MRT'),
('1', 'ศูนย์ราชการนนทบุรี', 0, 'MRT'),
('1', 'บางกระสอ', 0, 'MRT'),
('1', 'แยกนนทบุรี 1', 0, 'MRT'),
('1', 'สะพานพระนั่งเกล้า', 0, 'MRT'),
('1', 'ไทรม้า', 0, 'MRT'),
('1', 'บางรักน้อยท่าอิฐ', 0, 'MRT'),
('1', 'บางรักใหญ่', 0, 'MRT'),
('1', 'บางพลู', 0, 'MRT'),
('1', 'สามแยกบางใหญ่', 0, 'MRT'),
('1', 'ตลาดบางใหญ่', 0, 'MRT'),
('1', 'คลองบางไผ่', 0, 'MRT'),
('0', 'สยาม', 1, 'BTS'),
('0', 'ราชเทวี', 0, 'BTS'),
('0', 'พญาไท', 0, 'BTS'),
('0', 'อนุสาวรีย์ชัยสมรภูมิ', 0, 'BTS'),
('0', 'สนามเป้า', 0, 'BTS'),
('0', 'อารีย์', 0, 'BTS'),
('0', 'เสนาร่วม', 0, 'BTS'),
('0', 'สะพานควาย', 0, 'BTS'),
('0', 'หมอชิต', 1, 'BTS'),
('0', 'ห้าแยกลาดพร้าว', 1, 'BTS'),
('0', 'พหลโยธิน 24', 0, 'BTS'),
('0', 'รัชโยธิน', 0, 'BTS'),
('0', 'เสนานิคม', 0, 'BTS'),
('0', 'มหาวิทยาลัยเกษตรศาสตร์', 0, 'BTS'),
('0', 'กรมป่าไม้', 0, 'BTS'),
('0', 'บางบัว', 0, 'BTS'),
('0', 'กรมทหารราบ 11', 0, 'BTS'),
('0', 'วัดพระศรีมหาธาตุ', 0, 'BTS'),
('0', 'พหลโยธิน 59', 0, 'BTS'),
('0', 'สายหยุด', 0, 'BTS'),
('0', 'สะพานใหม่', 0, 'BTS'),
('0', 'โรงพยาบาลภูมิพลอดุลยเดช', 0, 'BTS'),
('0', 'พิพิธภัณฑ์กองทัพอากาศ', 0, 'BTS'),
('0', 'แยก คปอ.', 0, 'BTS'),
('0', 'คูคต', 0, 'BTS'),
('0', 'ชิดลม', 0, 'BTS'),
('0', 'เพลินจิต', 0, 'BTS'),
('0', 'นานา', 0, 'BTS'),
('0', 'อโศก', 1, 'BTS'),
('0', 'พร้อมพงษ์', 0, 'BTS'),
('0', 'ทองหล่อ', 0, 'BTS'),
('0', 'เอกมัย', 0, 'BTS'),
('0', 'พระโขนง', 0, 'BTS'),
('0', 'อ่อนนุช', 0, 'BTS'),
('0', 'บางจาก', 0, 'BTS'),
('0', 'ปุณณวิถี', 0, 'BTS'),
('0', 'อุดมสุข', 0, 'BTS'),
('0', 'บางนา', 0, 'BTS'),
('0', 'แบริ่ง', 0, 'BTS'),
('0', 'สำโรง', 0, 'BTS'),
('0', 'ปู่เจ้า', 0, 'BTS'),
('0', 'ช้างเอราวัณ', 0, 'BTS'),
('0', 'โรงเรียนนายเรือ', 0, 'BTS'),
('0', 'ปากน้ำ', 0, 'BTS'),
('0', 'ศรีนครินทร์', 0, 'BTS'),
('0', 'แพรกษา', 0, 'BTS'),
('0', 'สายลวด', 0, 'BTS'),
('0', 'เคหะฯ', 0, 'BTS'),
('1', 'สนามกีฬาแห่งชาติ', 0, 'BTS'),
('1', 'สยาม', 1, 'BTS'),
('1', 'ราชดำริ', 0, 'BTS'),
('1', 'ศาลาแดง', 1, 'BTS'),
('1', 'ช่องนนทรี', 0, 'BTS'),
('1', 'เซนต์หลุยส์', 0, 'BTS'),
('1', 'สุรศักดิ์', 0, 'BTS'),
('1', 'สะพานตากสิน', 0, 'BTS'),
('1', 'กรุงธนบุรี', 1, 'BTS'),
('1', 'วงเวียนใหญ่', 0, 'BTS'),
('1', 'โพธิ์นิมิตร', 0, 'BTS'),
('1', 'ตลาดพลู', 0, 'BTS'),
('1', 'วุฒากาศ', 0, 'BTS'),
('1', 'บางหว้า', 1, 'BTS'),
('2', 'ประชาธิปก', 0, 'BTS'),
('2', 'คลองสาน', 1, 'BTS'),
('2', 'เจริญนคร', 0, 'BTS'),
('2', 'กรุงธนบุรี', 1, 'BTS');

INSERT INTO `rmts`.`before_next` (`before3`, `before2`, `before1`, `station_id`, `next1`, `next2`, `next3`)
VALUES 
-- ARL สุววรณภูมิ -> พยาไท
(null,null,null, 90, 89, null, null),
(null, null, 90, 89, 36,   88, null), -- ลาดกระบัง ARL -> ลาดกระบัง SRT
(null, null, 89, 88, 87, null, null),
(null, null, 88, 87, 33,   86, null), -- หัวหมาก ARL -> หัวหมาก SRT
(null, null, 87, 86, 85, null, null),
(null, null, 86, 85, 111,  30, 84), -- มักกะสัน ARL => เพชรบุรี MRT 0 สายน้ำเงิน, อโศก SRT
(null, null, 85, 84, 83, null, null),
(null, null, 84, 83, 147,  27, null); -- ทางแยก ARL พยาไท -> BTS พยาไท, SRT พยาไท

INSERT INTO `rmts`.`before_next` (`before3`, `before2`, `before1`, `station_id`, `next1`, `next2`, `next3`)
VALUES 
-- BTS สายสีเขียวอ่อน คูคต 169 -> เคหะ 192
(null, null, null, 169, 168, null, null),
(null, null, 169, 168, 167, null, null),
(null, null, 168, 167, 166, null, null),
(null, null, 167, 166, 165, null, null),
(null, null, 166, 165, 164, null, null),
(null, null, 165, 164, 163, null, null),
(null, null, 164, 163, 162, null, null),
(null, null, 163, 162, 161, null, null),
(null, null, 162, 161, 160, null, null),
(null, null, 161, 160, 159, null, null),
(null, null, 160, 159, 158, null, null),
(null, null, 159, 158, 157, null, null),
(null, null, 158, 157, 156, null, null),
(null, null, 157, 156, 155, null, null),
(null, null, 156, 155, 154, null, null),
(null, null, 155, 154, 104, 153, null), -- ทางแยก ห้าแยกลาดพร้าว BTS สายเขียวอ่อน -> พหลโยธิน MRT 0 สายน้ำเงิน
(null, null, 154, 153, 103, 152, null), -- ทางแยก หมอชิต BTS สายเขียวอ่อน -> สวนจตุจักร MRT 0 สายน้ำเงิน
(null, null, 153, 152, 151, null, null),
(null, null, 152, 151, 150, null, null),
(null, null, 151, 150, 149, null, null),
(null, null, 150, 149, 148, null, null),
(null, null, 149, 148, 147, null, null),
(null,   83, 148, 147, 146,   27, null), -- ทางแยก ARL พยาไท ->  BTS พยาไท -> SRT พยาไท
(null, null, 147, 146, 145, null, null),
(null, null, 146, 145, 194, 170, null),  -- ทางแยก สยาม BTS 0 สายเขียวอ่อน -> สยาม BTS สาย 1 สายเขียว

-- BTS สยาม 145 -> เคหะ ฯ 192
(null, null, 145, 170, 171, null, null),
(null, null, 170, 171, 172, null, null),
(null, null, 171, 172, 173, null, null),
(null, null, 172, 173, 112, 174, null),  -- ทางแยก อโสก BTS -> สุขุมวิท MRT สาย 1
(null, null, 173, 174, 175, null, null),
(null, null, 174, 175, 176, null, null),
(null, null, 175, 176, 177, null, null),
(null, null, 176, 177, 178, null, null),
(null, null, 177, 178, 179, null, null),
(null, null, 178, 179, 180, null, null),
(null, null, 179, 180, 181, null, null),
(null, null, 180, 181, 182, null, null),
(null, null, 181, 182, 183, null, null),
(null, null, 182, 183, 184, null, null),
(null, null, 183, 184, 185, null, null),
(null, null, 184, 185, 186, null, null),
(null, null, 185, 186, 187, null, null),
(null, null, 186, 187, 188, null, null),
(null, null, 187, 188, 189, null, null),
(null, null, 188, 189, 190, null, null),
(null, null, 189, 190, 191, null, null),
(null, null, 190, 191, 192, null, null),
(null, null, 191, 192, null, null, null),

-- BTS สายสีเขียว สนามกีฬาแห่งชาติ -> บางหว้า 205
(null, null, null, 193, 194, null, null),
(null, 145, 193, 194, 195, null, null), -- ทางแยก สยาม BTS สาย 0 -> สยาม BTS สาย 1
(null, null, 194, 195, 196, null, null),
(null, null, 195, 196, 116, 197, null), -- ทางแยก BTS ศาลาแดง ->  MRT สีลม
(null, null, 196, 197, 198, null, null),
(null, null, 197, 198, 199, null, null),
(null, null, 198, 199, 200, null, null),
(null, null, 199, 200, 201, null, null),
(null, 200, 210, 201, 202, null, null), -- ทางแยก กรุงธน BTS ทอง -> กรุงธน BTS เขียว
(null, null, 201, 202, 203, null, null),
(null, null, 202, 203, 204, null, null),
(null, null, 203, 204, 205, null, null),
(null, null, 204, 205, 206, null, null),
(null, null, 205, 206, 124, null, null), -- ทางแยก บางหว้า BTS เขียว -> บางหว้า MRT น้ำเงิน

-- BTS สายสีทอง คลองสาน -> กรุงธนบุรี BTS สายสีทอง
(null, null, null, 208, 209, null, null),
(null, null, 208, 209, 210, null, null),
(null, null, 209, 210, 201, null, null); -- ทางแยก กรุงธน BTS ทอง ->  กรุงธน BTS เขียว

INSERT INTO `rmts`.`before_next` (`before3`, `before2`, `before1`, `station_id`, `next1`, `next2`, `next3`)
VALUES 
-- SRT โพรงมะเดื่อ -> กรุงเทพ
(null, null, null, 22, 21, null, null),
(null, null, 22, 21, 20, null, null),
(null, null, 21, 20, 19, null, null),
(null, null, 20, 19, 18, null, null),
(null, null, 19, 18, 17, null, null),
(null, null, 18, 17, 16, null, null),
(null, null, 17, 16, 15, null, null),
(null, null, 16, 15, 14, null, null),
(null, null, 15, 14, 13, null, null),
(null, null, 14, 13, 12, null, null),
(null, null, 13, 12, 11, null, null),
(null, null, 12, 11, 10, null, null),
(null, null, 11, 10, 9, null, null),
(null, null, 10, 9, 25, 8, null), -- ตลิ่งชัน SRT -> SRT บางระมาด
(null, null, 9, 8, 7, null, null),
(null, null, 8, 7, 130, 6, null), -- บางซ่อน SRT -> MRT บางซ่อน
(null, 40, 7, 6, 101, 5, null), -- นิคมรถไฟกม.11 -> SRT บางซื่อ -> บางซื่อ MRT
(null, null, 6, 5, 4, null, null),
(null, null, 5, 4, 3, null, null),
(null, null, 4, 3, 2, null, null),
(null, null, 3, 2, 1, null, null),
(null, null, 2, 1, 118, null, null), -- ทางแยก STR กรุงเทพ ->  MRT หัวลำโพง

-- SRT บางระมาด -> กรุงธนบุรี
(null, null, 9, 25, 24, null, null), -- ตลิ่งชัน SRT -> SRT บางระมาด
(null, null, 25, 24, 23, null, null),
(null, null, 24, 23, null, null, null),

-- SRT นวลนคร -> นิคมรถไฟกม.11
(null, null, null, 53, 52, null, null),
(null, null, 53, 52, 51, null, null),
(null, null, 52, 51, 50, null, null),
(null, null, 51, 50, 49, null, null),
(null, null, 50, 49, 48, null, null),
(null, null, 49, 48, 47, null, null),
(null, null, 48, 47, 46, null, null),
(null, null, 47, 46, 45, null, null),
(null, null, 46, 45, 44, null, null),
(null, null, 45, 44, 43, null, null),
(null, null, 44, 43, 42, null, null),
(null, null, 43, 42, 41, null, null),
(null, null, 42, 41, 40, null, null),
(null, null, 41, 40, 6, null, null), -- นิคมรถไฟกม.11 -> บางสื่อ SRT

-- SRT คลองหลวงเพ่ง -> กรุงเทพ
(null, null, null, 39, 38, null, null),
(null, null, 39, 38, 37, null, null),
(null, null, 38, 37, 36, null, null),
(null, 37, 89, 36, 35, null, null), -- ลาดกระบัง ARL -> ลาดกระบัง SRT
(null, null, 36, 35, 34, null, null),
(null, null, 35, 34, 33, null, null),
(null, 34, 87, 33, 32, null, null), -- หัวหมาก ARL -> หัวหมาก SRT
(null, null, 33, 32, 31, null, null),
(null, null, 32, 31, 30, null, null),
(null, 31, 85, 30, 29, 111, null), -- มักกะสัน ARL => อโศก SRT => เพชรบุรี MRT 0 สายน้ำเงิน
(null, null, 30, 29, 28, null, null),
(null, null, 29, 28, 27, null, null),
(28, 147, 83, 27, 26, null, null), -- ทางแยก BTS พยาไท, ทางแยก ARL พยาไท -> SRT พยาไท
(null, null, 27, 26, 1, null, null),

-- SRT มหาชัย 71 -> วงเวียนใหญ่ 54
(null, null, null, 71, 70, null, null),
(null, null, 71, 70, 69, null, null),
(null, null, 70, 69, 68, null, null),
(null, null, 69, 68, 67, null, null),
(null, null, 68, 67, 66, null, null),
(null, null, 67, 66, 65, null, null),
(null, null, 66, 65, 64, null, null),
(null, null, 65, 64, 63, null, null),
(null, null, 64, 63, 62, null, null),
(null, null, 63, 62, 61, null, null),
(null, null, 62, 61, 60, null, null),
(null, null, 61, 60, 59, null, null),
(null, null, 60, 59, 58, null, null),
(null, null, 59, 58, 57, null, null),
(null, null, 58, 57, 56, null, null),
(null, null, 57, 56, 55, null, null),
(null, null, 56, 55, 54, null, null),
(null, null, 55, 54, null, null, null),

-- SRT เขตเมือง 82 -> วงเวียนใหญ่ 72
(null, null, null, 82, 81, null, null),
(null, null, 82, 81, 80, null, null),
(null, null, 81, 80, 79, null, null),
(null, null, 80, 79, 78, null, null),
(null, null, 79, 78, 77, null, null),
(null, null, 78, 77, 76, null, null),
(null, null, 77, 76, 75, null, null),
(null, null, 76, 75, 74, null, null),
(null, null, 75, 74, 73, null, null),
(null, null, 74, 73, 72, null, null),
(null, null, 73, 72, null, null, null);

INSERT INTO `rmts`.`before_next` (`before3`, `before2`, `before1`, `station_id`, `next1`, `next2`, `next3`)
VALUES
-- MRT สีม่วง จากคลองบางไผ่ 144 -> เตาปูน 129 MRT
(null, null, null, 144, 143, null, null),
(null, null, 144, 143, 142, null, null),
(null, null, 143, 142, 141, null, null),
(null, null, 142, 141, 140, null, null),
(null, null, 141, 140, 139, null, null),
(null, null, 140, 139, 138, null, null),
(null, null, 139, 138, 137, null, null),
(null, null, 138, 137, 136, null, null),
(null, null, 137, 136, 135, null, null),
(null, null, 136, 135, 134, null, null),
(null, null, 135, 134, 133, null, null),
(null, null, 134, 133, 132, null, null),
(null, null, 133, 132, 131, null, null),
(null, null, 132, 131, 130, null, null),
(null, 131, 7, 130, 129, null, null), -- บางซ่อน SRT -> MRT บางซ่อน
(null, null, 130, 129, 100, null, null), -- MRT 1 เตาปูน -> เตาปูน MRT 0

-- MRT รัชดาพิเษก 106 -> ท่าพระ 91
(null, null, 105, 106, 107, null, null),
(null, null, 106, 107, 108, null, null),
(null, null, 107, 108, 109, null, null),
(null, null, 108, 109, 110, null, null),
(null, null, 109, 110, 111, null, null),
(110, 30, 85,     111, 112, null, null), -- อโสก SRT, มักกะสัน ARL => เพชรบุรี MRT 0 สายน้ำเงิน
(null, 111,  173, 112, 113, null, null),  -- ทางแยก อโสก BTS -> สุขุมวิท MRT สาย 1
(null, null, 112, 113, 114, null, null),
(null, null, 113, 114, 115, null, null),
(null, null, 114, 115, 116, null, null),
(null, 115,  196, 116, 117, null, null), -- ทางแยก BTS ศาลาแดง ->  MRT สีลม
(null, null, 116, 117, 118, null, null),
(null, 117,    1, 118, 119, null, null), -- ทางแยก STR กรุงเทพ ->  MRT หัวลำโพง
(null, null, 118, 119, 120, null, null),
(null, null, 119, 120, 121, null, null),
(null, null, 120, 121, 122, null, null),
(null, null, 121, 122, 91, null, null),

-- ท่าพระ แยกไป MRT ลาดพร้าว 105
(null, null, 122, 91, 92, 123, null),
(null, null, 91, 92, 93, null, null),
(null, null, 92, 93, 94, null, null),
(null, null, 93, 94, 95, null, null),
(null, null, 94, 95, 96, null, null),
(null, null, 95, 96, 97, null, null),
(null, null, 96, 97, 98, null, null),
(null, null, 97, 98, 99, null, null),
(null, null, 98, 99, 100, null, null),
(null, 99, 129, 100, 101, null, null), -- MRT สาย 1 เตาปูน -> เตาปูน MRT สาย 0
(null, 100, 6, 101, 102, null, null), -- SRT บางซื่อ -> บางซื่อ MRT
(null, null, 101, 102, 103, null, null),
(null, 102, 153, 103, 104, null, null), -- ทางแยก หมอชิต BTS สายเขียวอ่อน -> สวนจตุจักร MRT 0 สายน้ำเงิน
(null, 103, 154, 104, 105, null, null), -- ทางแยก ห้าแยกลาดพร้าว BTS สายเขียวอ่อน -> พหลโยธิน MRT 0 สายน้ำเงิน
(null, null, 104, 105, 106, null, null),

-- ท่าพระ แยกไป MRT หลักสอง 128
(null, null, 91, 123, 124, null, null),
(null, 123, 206, 124, 125, null, null), -- ทางแยก บางหว้า BTS เขียว -> บางหว้า MRT น้ำเงิน
(null, null, 124, 125, 126, null, null),
(null, null, 125, 126, 127, null, null),
(null, null, 126, 127, 128, null, null),
(null, null, 127, 128, null, null, null);

INSERT INTO `rmts`.`arl` (`station_id`, `station_codename`)
values
-- ARL สุววรณภูมิ -> พยาไท
(90, "A1"),
(89, "A2"),
(88, "A3"),
(87, "A4"),
(86, "A5"),
(85, "A6"),
(84, "A7"),
(83, "A8");

INSERT INTO `rmts`.`bts` (`station_id`, `station_zone`, `station_codename`)
values
-- สายเหนือ
(169, 0, "N24"),
(168, 0, "N23"),
(167, 0, "N22"),
(166, 0, "N21"),
(165, 0, "N20"),
(164, 0, "N19"),
(163, 0, "N18"),
(162, 0, "N17"),
(161, 0, "N16"),
(160, 0, "N15"),
(159, 0, "N14"),
(158, 0, "N13"),
(157, 0, "N12"),
(156, 0, "N11"),
(155, 0, "N10"),
(154, 0, "N9"),
(153, 0, "N8"),
(152, 0, "N7"),
(151, 0, "N6"),
(150, 0, "N5"),
(149, 0, "N4"),
(148, 0, "N3"),
(147, 0, "N2"),
(146, 0, "N1"),
(145, 0, "CEN"),  -- CENTER สยาม

-- สายตะวันออก
(170, 0, "E1"),
(171, 0, "E2"),
(172, 0, "E3"),
(173, 0, "E4"),
(174, 0, "E5"),
(175, 0, "E6"),
(176, 0, "E7"),
(177, 0, "E8"),
(178, 0, "E9"),
(179, 0, "E10"),
(180, 0, "E11"),
(181, 0, "E12"),
(182, 0, "E13"),
(183, 0, "E14"),
(184, 0, "E15"),
(185, 0, "E16"),
(186, 0, "E17"),
(187, 0, "E18"),
(188, 0, "E19"),
(189, 0, "E20"),
(190, 0, "E21"),
(191, 0, "E22"),
(192, 0, "E23"),

-- สายสีเขียว ตะวันตก(สนามกีฬาแห่งชาติ) และใต้
(193, 0, "W1"),
(194, 0, "CENTER"),
(195, 0, "S1"),
(196, 0, "S2"),
(197, 0, "S3"),
(198, 0, "S4"),
(199, 0, "S5"),
(200, 0, "S6"),
(201, 0, "S7"),
(202, 0, "S8"),
(203, 0, "S9"),
(204, 0, "S10"),
(205, 0, "S11"),
(206, 0, "S12"),

--  สายสีทอง
(208, 0, "G3"),
(209, 0, "G2"),
(210, 0, "G1");

INSERT INTO `rmts`.`mrt` (`station_id`, `station_codename`)
values

-- MRT สีม่วง
(144, "PP01"),
(143, "PP02"),
(142, "PP03"),
(141, "PP04"),
(140, "PP05"),
(139, "PP06"),
(138, "PP07"),
(137, "PP08"),
(136, "PP09"),
(135, "PP10"),
(134, "PP11"),
(133, "PP12"),
(132, "PP13"),
(131, "PP14"),
(130, "PP15"),
(129, "PP16"),

-- MRT สายน้ำเงิน รัชดาพิเษก -> อิสระภาพ
(106, "BL16"),
(107, "BL17"),
(108, "BL18"),
(109, "BL19"),
(110, "BL20"),
(111, "BL21"),
(112, "BL22"),
(113, "BL23"),
(114, "BL24"),
(115, "BL25"),
(116, "BL26"),
(117, "BL27"),
(118, "BL28"),
(119, "BL29"),
(120, "BL30"),
(121, "BL31"),
(122, "BL32"),

-- MRT สายน้ำเงิน ท่าพระ -> ลาดพร้าว
(91, "BL01"),
(92, "BL02"),
(93, "BL03"),
(94, "BL04"),
(95, "BL05"),
(96, "BL06"),
(97, "BL07"),
(98, "BL08"),
(99, "BL09"),
(100, "BL10"),
(101, "BL11"),
(102, "BL12"),
(103, "BL13"),
(104, "BL14"),
(105, "BL15"),

-- ท่าพระ -> หลักสอง
(123, "BL33"),
(124, "BL34"),
(125, "BL35"),
(126, "BL36"),
(127, "BL37"),
(128, "BL38");

INSERT INTO `rmts`.`mrt` (`station_id`, `station_zone`, `used_time`)
values 
(82, 0, 6),
(81, 0, 4),
(80, 0, 6),
(79, 0, 5),
(78, 0, 4),
(77, 0, 4),
(76, 0, 4),
(75, 0, 5),
(74, 0, 5),
(73, 0, 3),
(72, 0, 3),
(71, 0, 3),
(70, 0, 4),
(69, 0, 6),
(68, 0, 4),
(67, 0, 2),
(66, 0, 3),
(65, 0, 3),
(64, 0, 3),
(63, 0, 6),
(62, 0, 3),
(61, 0, 3),
(60, 0, 4),
(59, 0, 3),
(58, 0, 3),
(57, 0, 3),
(56, 0, 6),
(55, 0, 4),
(54, 0, 4),
(53, 0, 3),
(52, 0, 2),
(51, 0, 5),
(50, 0, 3),
(49, 0, 2),
(48, 0, 2),
(47, 0, 1),
(46, 0, 2),
(45, 0, 1),
(44, 0, 1),
(43, 0, 2),
(42, 0, 2),
(41, 0, 4),
(40, 0, 3),
(39, 0, 3),
(38, 0, 3),
(37, 0, 3),
(36, 0, 3),
(35, 0, 3),
(34, 0, 4),
(33, 0, 6),
(32, 0, 2),
(31, 0, 3),
(30, 0, 5),
(29, 0, 4),
(28, 0, 2),
(27, 0, 2),
(26, 0, 10),
(25, 0, 3),
(24, 0, 4),
(23, 0, 2),
(22, 0, 5),
(21, 0, 3),
(20, 0, 3),
(19, 0, 5),
(18, 0, 4),
(17, 0, 5),
(16, 0, 4),
(15, 0, 4),
(14, 0, 5),
(13, 0, 6),
(12, 0, 3),
(11, 0, 3),
(10, 0, 3),
(9, 0, 5),
(8, 0, 8),
(7, 0, 7),
(6, 0, 7),
(5, 0, 3),
(4, 0, 3),
(3, 0, 3),
(2, 0, 3),
(1, 0, 3);