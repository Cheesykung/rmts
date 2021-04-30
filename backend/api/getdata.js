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
    while (count < stop) {
      let table = await pool.query("select * from stations where station_id = ?", [data[count]])
      let tran = ''
      const name = table[0][0].station_name
      const type = table[0][0].type
      if (table[0][0].transit == 1) {
        tran = 'true'
        totaltran += 1
      }
      else {
        tran = 'false'
      }

      if (table[0][0].type == 'SRT') {
        let query1 = await pool.query("select used_time from srt where station_id = ?", [data[count]])
        time = query1[0][0].used_time
      } else if (table[0][0].type == 'MRT' || table[0][0].type == 'BTS') {
        time = 2
      } else if (table[0][0].type == 'ARL') {
        time = 5
      }

      total_time += time

      const saved = {
        'name': name,
        'type': type,
        'transit': tran,
        'time': time,
        'cost': 0
      }
      path.push(saved)
      count++
    }//while
    const route = {
      fullpath: path,
      total_cost: 0,
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
        stations : stations,
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
