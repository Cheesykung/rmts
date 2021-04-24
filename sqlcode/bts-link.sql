INSERT INTO `rmts`.`before_next` (`before3`, `before2`, `before1`, `station_id`, `next1`, `next2`, `next3`)
VALUES 
-- BTS สายสีเขียวอ่อน คูคต 169 -> เคหะ 192
(null, null, 170, 169, 168, null, null),
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