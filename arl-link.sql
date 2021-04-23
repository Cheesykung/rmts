INSERT INTO `rmts`.`before_next` (`before`, `station_id`, `next`)
VALUES 
-- ARL สุววรณภูมิ -> พยาไท
(null, 90, 89),
(90, 89, 36), -- ลาดกระบัง ARL -> ลาดกระบัง SRT
(90, 89, 88),
(89, 88, 87),
(88, 87, 33), -- หัวหมาก ARL -> หัวหมาก SRT
(88, 87, 86),
(87, 86, 85),
(86, 85, 111), -- มักกะสัน ARL => เพชรบุรี MRT 0 สายน้ำเงิน
(86, 85, 30), -- มักกะสัน ARL => อโศก SRT
(86, 85, 84),
(85, 84, 83),
(84, 83, 147), -- ทางแยก ARL พยาไท -> BTS พยาไท
(84, 83, 27); -- ทางแยก ARL พยาไท -> SRT พยาไท