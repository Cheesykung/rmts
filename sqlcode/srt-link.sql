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

-- SRT เขตเมือง 82 -> บ้านแหลม 72
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