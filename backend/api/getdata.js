// require package
const express = require("express");
const pool = require("../config");

router = express.Router();

router.get("/getdata", async (req, res) => {
  let array = req.body.data;
  let final = []
  for (i in array) {
    let data = array[i]
    let path = []
    let totaltran = 0
    let stop = data.length
    let count = 0
    let total_time = 0
    let time = 0
    
    let srt_line1 = 0
    let srt_line2 = 0
    let srt_line3 = 0
    let srt_line4_5 = 'false'

    let total_bts = 0
    let gold_line = 'false'

    let total_arl = 0

    let blue_line = 0
    let purple_line = 0

    let srt_cost = 0
    let bst_cost = 0
    let arl_cost = 0
    let mrt_cost = 0

    let total_cost = 0

    while (count < stop) {
      let table = await pool.query("select * from stations where station_id = ?", [data[count]])
      let tran = 'false'
      const name = table[0][0].station_name
      const s_type = table[0][0].type
      if(count<stop-1){
        let next_s = await pool.query("select * from stations where station_id = ?", [data[count+1]])
        if(next_s[0][0].type != s_type || next_s[0][0].station_line != table[0][0].station_line){
            tran = 'true'
            totaltran += 1          
        }
      }//check transit

      if (table[0][0].type == 'SRT') {
        let query1 = await pool.query("select used_time, station_zone from srt where station_id = ?", [data[count]])
        time = query1[0][0].used_time
      } 
      else if (table[0][0].type == 'MRT' || table[0][0].type == 'BTS') {
        time = 2
      } 
      else if (table[0][0].type == 'ARL') {
        time = 5
      }
      total_time += time
      //time

      if(table[0][0].type == 'SRT' && count == 0 && name == 'กรุงเทพ'||name == 'บางซื่อ'){
        total_cost += 2
      }
      else if(table[0][0].type == 'SRT'){
        if(table[0][0].station_line == 1){ srt_line1 += 1 }
        else if(table[0][0].station_line == 2){ srt_line2 += 1 }
        else if(table[0][0].station_line == 3){ srt_line3 += 1 }
        else if(table[0][0].station_line == 4||table[0][0].station_line == 5){ srt_line4_5 = 'true' }
      }
      else if(table[0][0].type == 'ARL'){
        total_arl += 1
      }
      else if(table[0][0].type == 'BTS'){
        if(table[0][0].station_line == 2){
           gold_line = 'true'
        }
        else{
          total_bts += 1
        }
      }
      else if(table[0][0].type == 'MRT'){
        if(table[0][0].station_line == 0){
          blue_line += 1 
       }
       else{
         purple_line += 1
       }
      }

      const saved = {
        'name': name,
        'type': s_type,
        'transit': tran,
        'time': time
      }
      path.push(saved)
      count++
    }//while

    if(srt_line1 != 0 || srt_line2 != 0 || srt_line3 != 0){
      srt_cost = ((14*srt_line1)/13) + ((8*srt_line2)/14) + ((6*srt_line3)/14)
    }  
    if(srt_line4_5 == 'true') {srt_cost += 10}
    //cost_srt

    if(total_bts != 0){
      bst_cost = (((total_bts/2)-1)*3) + ((total_bts/2)*4)
    }
    if(gold_line == 'true'){bst_cost += 15}
    if(bst_cost >= 44){bst_cost = 44}
    //cost_bts

    if(total_arl != 0){
      arl_cost = 5 * (total_arl+1)
    }
    //cost_arl

    if(blue_line != 0 || purple_line != 0){
      mrt_cost = ((3*blue_line)+16)+((3*blue_line)+14)
    }
    if(mrt_cost >= 42){mrt_cost = 42}
    //cost_mrt

    total_cost = Math.ceil(srt_cost + bst_cost + arl_cost + mrt_cost)
    console.log('================================')
    console.log(i)
    console.log(srt_cost , bst_cost , arl_cost , mrt_cost)
    console.log("end")
    
    const route = {
      fullpath: path,
      total_cost: total_cost,
      total_time: total_time,
      total_transit: totaltran,
    }
    final.push(route)
  }//for

  res.json({
    routes: final,
    error: null
  });//res

});//get

router.get("/stations", (req, res) => {
  res.setHeader("Access-Control-Allow-Origin", "*");
  res.setHeader(
    "Access-Control-Allow-Methods",
    "GET, POST, OPTIONS, PUT, PATCH, DELETE"
  ); // If needed
  res.setHeader(
    "Access-Control-Allow-Headers",
    "X-Requested-With,content-type"
  );
  res.setHeader("Access-Control-Allow-Credentials", true);
  let data = pool.query("select station_name,type from stations ");
  data
    .then((results) => {
      console.log(results[0]);
      const stations = results[0];
      res.json({
        stations: stations,
        // id : numid,
        error: null,
      });
    })
    .catch((err) => {
      console.log(show);
      console.log(err);
    });
});

// router.get("/station/:id", (req, res) => {
//   console.log(req.params.id);
//   let test = pool.query("select * from stations where station_id = ?", [
//     req.params.id,
//   ]);
//   test
//     .then((results) => {
//       console.log(results[0][0]);
//       const show = results[0][0];
//       res.json({
//         name: show,
//         totaltransit: totaltran,
//         error: null,
//       });
//     })
//     .catch((err) => {
//       console.log(show);
//       console.log(err);
//     });
// });

// router.post("/newstation", (req, res) => {
//   const line = req.body.line;
//   const name = req.body.name;
//   const tran = req.body.tran;
//   const type = req.body.type;
//   let test2 = pool.query(
//     "insert into stations(station_line,station_name,transit,type) values(?,?,?,?);",
//     [line, name, tran, type]
//   );
//   let test = pool.query(
//     "select * from stations where station_id = (select max(station_id) from stations )"
//   );
//   Promise.all([test2, test])
//     .then((results) => {
//       console.log(results[1][0]);
//       const blogs = results[1][0];
//       res.json({
//         line: blogs,
//         error: null,
//       });
//     })
//     .catch((err) => {
//       console.log(err);
//     });
// });

// app.post('/updatestation', (req, res) => {
//   const line = req.body.line
//   const name = req.body.name
//   const tran = req.body.tran
//   const type = req.body.type
//   let test2 = pool.query("insert into stations(station_line,station_name,transit,type) values(?,?,?,?);", [line,name,tran,type])
//   let test = pool.query("select * from stations where station_id = (select max(station_id) from stations )")
//   Promise.all([test2,test]).then((results) =>
//   {
//     console.log(results[1][0])
//     const blogs = results[1][0];
//     res.json({
//       line: blogs,
//       error: null,
//     });
//   })
//   .catch((err) => {
//     console.log(err)
//   });
// })

// app.post('/updatestation', (req, res) => {
//   const line = req.body.line
//   const name = req.body.name
//   const tran = req.body.tran
//   const type = req.body.type
//   let test2 = pool.query("insert into stations(station_line,station_name,transit,type) values(?,?,?,?);", [line,name,tran,type])
//   let test = pool.query("select * from stations where station_id = (select max(station_id) from stations )")
//   Promise.all([test2,test]).then((results) =>
//   {
//     console.log(results[1][0])
//     const blogs = results[1][0];
//     res.json({
//       line: blogs,
//       error: null,
//     });
//   })
//   .catch((err) => {
//     console.log(err)
//   });
// })

exports.router = router;
