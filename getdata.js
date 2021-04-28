// require package
const express = require("express");
const pool = require("./config");

router = express.Router();
router.get("/stations", (req, res) => {
  const id = req.body.id;
  let test = pool.query("select * from stations ");
  test
    .then((results) => {
      console.log(results[0]);
      const name = results[0];
      // const numid = results[0].station_id
      res.json({
        name: name,
        // id : numid,
        error: null,
      });
    })
    .catch((err) => {
      console.log(show);
      console.log(err);
    });
});

router.get("/getdata", async (req, res) => {
  
  let array = req.body.data;
  let final = []
  for (i in array) {
    let data = array[i]
    let path = []
    let totaltran = 0
    let stop = data.length
    let count = 0
    while(count<stop){
      let table = await pool.query("select * from stations where station_id = ?",[data[count]])
      let tran = ''
      const name =  table[0][0].station_name
      const type =  table[0][0].type
      if (table[0][0].transit == 1){
        tran = 'true'
        totaltran += 1
      }
      else{
        tran = 'false'
      }
      const  saved = {
                'name' : name ,
                'type' : type ,
                'transit' : tran,
                'time' : 1,
                'cost' : 0
            }
      path.push(saved)
      count++
    }//while
    const route = {
      fullpath: path,
      total_cost: 0,
      total_time: 0 ,
      total_transit: totaltran,
    }
    final.push(route)
  }//for
  
  res.json({
    way : final,
    error: null
  });//res

});//get

router.get("/station/:id", (req, res) => {
  console.log(req.params.id);
  let test = pool.query("select * from stations where station_id = ?", [
    req.params.id,
  ]);
  test
    .then((results) => {
      console.log(results[0][0]);
      const show = results[0][0];
      res.json({
        name : show,
        totaltransit : totaltran,
        error: null,
      });
    })
    .catch((err) => {
      console.log(show);
      console.log(err);
    });
});

router.post("/newstation", (req, res) => {
  const line = req.body.line;
  const name = req.body.name;
  const tran = req.body.tran;
  const type = req.body.type;
  let test2 = pool.query(
    "insert into stations(station_line,station_name,transit,type) values(?,?,?,?);",
    [line, name, tran, type]
  );
  let test = pool.query(
    "select * from stations where station_id = (select max(station_id) from stations )"
  );
  Promise.all([test2, test])
    .then((results) => {
      console.log(results[1][0]);
      const blogs = results[1][0];
      res.json({
        line: blogs,
        error: null,
      });
    })
    .catch((err) => {
      console.log(err);
    });
});

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
