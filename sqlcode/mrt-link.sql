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
(null, null, null, 106, 107, null, null),
(null, null, 106, 107, 108, null, null),
(null, null, 107, 108, 109, null, null),
(null, null, 108, 109, 110, null, null),
(null, null, 109, 110, 111, null, null),
(110, 30, 85, 111, 112, null, null), -- อโสก SRT, มักกะสัน ARL => เพชรบุรี MRT 0 สายน้ำเงิน
(null, 111, 173, 112, 113, null, null),  -- ทางแยก อโสก BTS -> สุขุมวิท MRT สาย 1
(null, null, 112, 113, 114, null, null),
(null, null, 113, 114, 115, null, null),
(null, null, 114, 115, 116, null, null),
(null, 115, 196, 116, 117, null, null), -- ทางแยก BTS ศาลาแดง ->  MRT สีลม
(null, null, 116, 117, 118, null, null),
(null, 117, 1, 118, 119, null, null), -- ทางแยก STR กรุงเทพ ->  MRT หัวลำโพง
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
(null, null, 104, 105, null, null, null),

-- ท่าพระ แยกไป MRT หลักสอง 128
(null, null, 91, 123, 124, null, null),
(null, 123, 206, 124, 125, null, null), -- ทางแยก บางหว้า BTS เขียว -> บางหว้า MRT น้ำเงิน
(null, null, 124, 125, 126, null, null),
(null, null, 125, 126, 127, null, null),
(null, null, 126, 127, 128, null, null),
(null, null, 127, 128, null, null, null);