const PjobJabFinder = require('../components/searchEngine')
const express = require('express')
const axios = require('axios')
const pool = require('../config')

router = express.Router()

router.post('/search', async (req, res, next) => {
    const start = req.query.start
    const des = req.query.des
    let path = null
    const connection = pool.getConnection()
    await connection.beginTransaction()

    const promise1 = pool.query("SELECT * FROM before_next");

    promise1.then((results) => {
            const data = results[0];
            path = data[0]
        })
        .catch((err) => {
            return res.status(500).json(err);
        });

    axios.post('http://localhost:3000/hello', { key: 'Fook' }).then((response) => {
        let y = response
        res.send(y.data)
    }).catch((err) => {
        console.log(err);
    });
})

router.post('/hello', (req, res) => {
    let x = req.body.key
    res.send("Hello " + x)
})

exports.router = router;