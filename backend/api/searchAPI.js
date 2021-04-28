const pathFinder = require("../components/searchEngine");
const express = require("express");
const axios = require("axios");
const pool = require("../config");

router = express.Router();

router.post("/search", async (req, res, next) => {
  const start = req.query.start;
  const des = req.query.des;
  const promise1 = pool.query("SELECT * FROM before_next");

  Promise.all([promise1])
    .then((results) => {
      const blogs = results[0][0];
      let path = blogs.map((element) => {
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
      if (routes.length > 20) {
        routes.splice(20, routes.length - 20);
      }

      axios({
        method: "get",
        url: "http://localhost:3000/getdata",
        data: { data: routes },
      })
        .then((response) => {
          let payload = response;
          res.status(200).send(payload.data);
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
