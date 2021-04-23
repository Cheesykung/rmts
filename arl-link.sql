INSERT INTO `rmts`.`before_next` (`before`, `station_id`, `next`)
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