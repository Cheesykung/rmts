INSERT INTO `rmts`.`before_next` (`before`, `station_id`, `next`)
VALUES 
-- SRT โพรงมะเดื่อ -> กรุงเทพ
(null, 22, 21),
(22, 21, 20),
(21, 20, 19),
(20, 19, 18),
(19, 18, 17),
(18, 17, 16),
(17, 16, 15),
(16, 15, 14),
(15, 14, 13),
(14, 13, 12),
(13, 12, 11),
(12, 11, 10),
(11, 10, 9),
(10, 9, 25), -- ตลิ่งชัน SRT -> SRT บางระมาด
(10, 9, 8),
(9, 8, 7),
(8, 7, 130), -- บางซ่อน SRT -> MRT บางซ่อน
(8, 7, 6),
(7, 6, 101), -- SRT บางซื่อ -> บางซื่อ MRT
(40, 6, 5), -- นิคมรถไฟกม.11 -> บางซื่อ SRT
(7, 6, 5),
(6, 5, 4),
(5, 4, 3),
(4, 3, 2),
(3, 2, 1),
(2, 1, 118), -- ทางแยก STR กรุงเทพ ->  MRT หัวลำโพง
(2, 1, null),

-- SRT บางระมาด -> กรุงธนบุรี
(9, 25, 24), -- ตลิ่งชัน SRT -> SRT บางระมาด
(25, 24, 23),
(24, 23, null),

-- SRT นวลนคร -> นิคมรถไฟกม.11
(null, 53, 52),
(53, 52, 51),
(52, 51, 50),
(51, 50, 49),
(50, 49, 48),
(49, 48, 47),
(48, 47, 46),
(47, 46, 45),
(46, 45, 44),
(45, 44, 43),
(44, 43, 42),
(43, 42, 41),
(42, 41, 40),
(41, 40, 6), -- นิคมรถไฟกม.11 -> บางสื่อ SRT

-- SRT คลองหลวงเพ่ง -> กรุงเทพ
(null, 39, 38),
(39, 38, 37),
(38, 37, 36),
(89, 36, 35), -- ลาดกระบัง ARL -> ลาดกระบัง SRT
(37, 36, 35),
(36, 35, 34),
(35, 34, 33),
(87, 33, 32), -- หัวหมาก ARL -> หัวหมาก SRT
(34, 33, 32),
(33, 32, 31),
(32, 31, 30),
(85, 30, 29), -- มักกะสัน ARL => อโศก SRT
(31, 30, 111), -- อโสก SRT => เพชรบุรี MRT 0 สายน้ำเงิน
(31, 30, 29),
(30, 29, 28),
(29, 28, 27),
(83, 27, 26), -- ทางแยก ARL พยาไท -> SRT พยาไท
(147, 27, 26), -- ทางแยก BTS พยาไท -> SRT พยาไท
(28, 27, 26),
(27, 26, 1);

--SRT มหาชัย 71 -> วงเวียนใหญ่ 54
(null, 71, 70),
(71, 70, 69),
(70, 69, 68),
(69, 68, 67),
(68, 67, 66),
(67, 66, 65),
(66, 65, 64),
(65, 64, 63),
(64, 63, 62),
(63, 62, 61),
(62, 61, 60),
(61, 60, 59),
(60, 59, 58),
(59, 58, 57),
(58, 57, 56),
(57, 56, 55),
(56, 55, 54),
(55, 54, null),

--SRT เขตเมือง 82 -> วงเวียนใหญ่ 72
(null, 82, 81),
(82, 81, 80),
(81, 80, 79),
(80, 79, 78),
(79, 78, 77),
(78, 77, 76),
(77, 76, 75),
(76, 75, 74),
(75, 74, 73),
(74, 73, 72),
(73, 72, null),