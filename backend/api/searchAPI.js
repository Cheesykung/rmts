const express = require('express')

router = express.Router()

router.get('/', (req, res, next) => {
    res.send('Hello world')
})

exports.router = router;