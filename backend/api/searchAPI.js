const pathFinder = require("../components/searchEngine");
const express = require("express");
const axios = require("axios");
const pool = require("../config");

router = express.Router();

router.get("/search", async (req, res, next) => {
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

  const begin = req.query.start;
  const start_type = req.query.start_type;
  const finish = req.query.des;
  const des_type = req.query.des_type;

  const promise = pool.query(
    " SELECT station_id FROM stations WHERE station_name = ? and type = ? ",
    [begin, start_type]
  );
  let start = await promise.then((results) => {
    try {
      const getData = results[0][0];
      return getData.station_id;
    } catch (e) {
      return 0;
    }
  });

  const promise2 = pool.query(
    " SELECT station_id FROM stations WHERE station_name = ? and type = ? ",
    [finish, des_type]
  );

  let des = await promise2.then((results) => {
    try {
      const getData = results[0][0];
      return getData.station_id;
    } catch (e) {
      return 0;
    }
  });

  const promise3 = pool.query("SELECT * FROM before_next");

  Promise.all([promise3])
    .then((results) => {
      const getData = results[0][0];
      let path = getData.map((element) => {
        return [
          element.before3,
          element.before2,
          element.before1,
          element.station_id,
          element.next1,
          element.next2,
          element.next3,
        ];
      });

      // begin finding routes
      let routes = pathFinder(start, des, path);
      // sort for most smaller first
      routes.sort((a, b) => {
        if (a.lenght < b.lenght) {
          return -1;
        } else if (a.lenght > b.lenght) {
          return 1;
        } else {
          return 0;
        }
      });

      // filter to max the routes for 20 routes
      if (routes.length > 5) {
        routes.splice(5, routes.length - 5);
      }
      axios({
        method: "get",
        url: "http://localhost:3000/getdata",
        data: { data: routes },
      })
        .then((response) => {
          let payload = response;
          if (payload.data.routes.length <= 0) {
            res.status(404).send("Not Found");
          } else {
            res.status(200).send(payload.data);
          }
        })
        .catch((err) => {
          res.status(400).send("Bad Request");
          console.log(err);
        });
    })
    .catch((err) => {
      res.status(500).send("Internal Server Error");
      return next(err);
    });
});

exports.router = router;
