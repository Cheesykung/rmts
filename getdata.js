// require package
const express = require('express')
const pool = require('./config')

router = express.Router()
let finish = []
let totaltran = 0
router.get('/stations', (req, res) => {
  const id = req.body.id
  let test = pool.query("select * from stations ")
  test.then((results) => {
    console.log(results[0])
    const name = results[0]
    // const numid = results[0].station_id
    res.json({
      name : name,
      // id : numid,
      error: null,
    });
  })
  .catch((err) => {
    console.log(show)
    console.log(err)
  });
})

router.get('/getdata', (req, res) => {
  
  const array = req.body.data
  array.map(element => {
    let save = []
    let test = pool.query("select * from stations where station_id = ?",[element])
    let tran = ''
    test.then((results) => {
      const name = results[0][0].station_name
      const type = results[0][0].type
      if (results[0][0].transit == 1){
        tran = 'true' 
        totaltran += 1
      }
      else{
        tran = 'false'
      }
      console.log('============')
      save.push(name)
      save.push(type)
      save.push(tran)
      console.log(save)
      finish.push(save)
      
      console.log(finish)
      console.log(totaltran)
  })
      .catch((err) => {
        console.log(err)
      });
  });
  
  res.json({
    name : array,
    result : finish,
    total:totaltran,
    error: null,
  });
})

router.get('/station/:id', (req, res) => { 
  console.log(req.params.id)
  let test = pool.query("select * from stations where station_id = ?",[req.params.id])
  test.then((results) => {
    console.log(results[0][0])
    const show = results[0][0];
    res.json({
      name : show,
      totaltransit : totaltran,
      error: null,
    });
  })
  .catch((err) => {
    console.log(show)
    console.log(err)
  });
})

router.post('/newstation', (req, res) => {
  const line = req.body.line
  const name = req.body.name
  const tran = req.body.tran
  const type = req.body.type
  let test2 = pool.query("insert into stations(station_line,station_name,transit,type) values(?,?,?,?);", [line,name,tran,type])
  let test = pool.query("select * from stations where station_id = (select max(station_id) from stations )")
  Promise.all([test2,test]).then((results) =>
  {
    console.log(results[1][0])
    const blogs = results[1][0];
    res.json({
      line: blogs,
      error: null,
    });
  })
  .catch((err) => {
    console.log(err)
  });
}) 

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