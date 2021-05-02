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

    let bts_line1 = 0
    let bts_line2 = 0
    let bts_line3 = 0
    let bts_line4 = 0
    let gold_line = 'false'
    let tran_bts = 0

    let total_arl = 0

    let blue_line = 0
    let blue_cost = 0
    let purple_line = 0
    let purple_cost = 0

    let srt_cost = 0
    let bts_cost = 0
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
        if(next_s[0][0].type != s_type ){
            tran = 'true'
            totaltran += 1          
        }
        else if(next_s[0][0].station_line != table[0][0].station_line && next_s[0][0].type != 'SRT' && s_type != 'SRT'){
            tran = 'true'
            totaltran += 1
        }
      }//check transit

      if (s_type == 'SRT') {
        let query1 = await pool.query("select used_time, station_zone from srt where station_id = ?", [data[count]])
        time = query1[0][0].used_time
      } 
      else if (s_type == 'MRT' || s_type == 'BTS') {
        time = 2
      } 
      else if (s_type == 'ARL') {
        time = 5
      }
      total_time += time
      //time

      if(s_type == 'SRT' && count == 0 && name == 'กรุงเทพ'||name == 'บางซื่อ'){
        total_cost += 2
      }
      if(s_type == 'SRT'){
        if(table[0][0].station_line == 1){ srt_line1 += 1 }
        else if(table[0][0].station_line == 2){ srt_line2 += 1 }
        else if(table[0][0].station_line == 3){ srt_line3 += 1 }
        else if(table[0][0].station_line == 4||table[0][0].station_line == 5){ srt_line4_5 = 'true' }
      }
      else if(s_type == 'ARL'){
        total_arl += 1
      }
      else if(s_type == 'BTS'){
        if(table[0][0].station_line == 2){
           gold_line = 'true'
        }
        else{
          if(table[0][0].station_id <=153 && table[0][0].station_id >=145 
          || table[0][0].station_id <=178 && table[0][0].station_id >=170
          || table[0][0].station_id <=202 && table[0][0].station_id >=193){
            bts_line1 += 1
          }
          else if(table[0][0].station_id <=168 && table[0][0].station_id >=154){
            bts_line2 += 1
          }
          else if(table[0][0].station_id <=192 && table[0][0].station_id >=179){
            bts_line3 += 1
          }
          else if(table[0][0].station_id <=206 && table[0][0].station_id >=203){
            bts_line4 += 1
          }
        }
      }
      else if(s_type == 'MRT'){
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

    if(bts_line1 != 0|| bts_line2 != 0|| bts_line3 != 0|| bts_line4 != 0){
      if (bts_line1 != 0){
        if(bts_line1-1 >= 8){ bts_cost += 44}
        else if(bts_line1-1 >= 6){ bts_cost += (((bts_line1-1)*3)+3)+16}
        else if(bts_line1-1 >= 4){ bts_cost += (((bts_line1-1)*3)+2)+16}
        else if(bts_line1-1 >= 2){ bts_cost += (((bts_line1-1)*3)+1)+16}
        else{ bts_cost += 16}
        tran_bts += 1
      }
      if (bts_line2 != 0){
        if(((bts_line2-1)*3)+15 >= 45){ bts_cost += 45}
        else{ bts_cost += ((bts_line2-1)*3)+15 }
        tran_bts += 1
      }
      if (bts_line3 != 0){
        if(((bts_line3-1)*3)+15 >= 45){ bts_cost += 45}
        else{ bts_cost += ((bts_line3-1)*3)+15 }
        tran_bts += 1
      }
      if (bts_line4 != 0){
        if(((bts_line4-1)*3)+15 >= 24){ bts_cost += 24}
        else{ bts_cost += ((bts_line4-1)*3)+15 }
        tran_bts += 1
      }
      bts_cost -= (tran_bts-1)*15
    }
    if(gold_line == 'true'){bts_cost += 15}
    //cost_bts

    if(total_arl != 0){
      arl_cost = 5 * (total_arl+1)
    }
    //cost_arl

    if(blue_line != 0 || purple_line != 0){
      if(blue_line-1 >= 12){ blue_cost += 42}
      else if(blue_line-1 >= 10){ blue_cost += (((blue_line-1)*2)+18) }
      else if(blue_line-1 >= 7){ blue_cost += (((blue_line-1)*2)+17)}
      else if(blue_line-1 >= 4){ blue_cost += (((blue_line-2)*2)+18)}
      else{ blue_cost += (((blue_line-2)*2)+17)}

      if(purple_line-1 >= 11){ purple_cost += 42}
      else if(purple_line-1 >= 9){ purple_cost += ((((purple_line-1)*2)+3)+17) }
      else if(purple_line-1 >= 6){ purple_cost += ((((purple_line-1)*3)-5)+17)}
      else if(purple_line-1 >= 4){ purple_cost += (((purple_line-1)*2)+17)}
      else{ purple_cost += (((purple_line-2)*3)+17)}
    }
    if(blue_line != 0 && purple_line != 0){ 
      mrt_cost = blue_cost + purple_cost -14 
    }
    else{
      if(blue_line != 0){ mrt_cost += blue_cost }
      else{ mrt_cost += purple_cost }
    }
    //cost_mrt

    total_cost = Math.ceil(srt_cost + bts_cost + arl_cost + mrt_cost)
    
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
