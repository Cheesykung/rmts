// require package
const express = require('express')
const bodyParser = require('body-parser')

// create instance
const app = express()

// use static for store static file like image file at path 'asset'
app.use(express.static('asset'))

// config format
app.use(bodyParser.json()) // for parsing application/json
app.use(express.urlencoded({ extended: true })) // for parsing application/x-www-form-urlencoded

//router
const searchRouter = require('./api/searchAPI')
const getdata = require('./api/getdata')

// register router
app.use(searchRouter.router)
app.use(getdata.router)

// open port
app.listen(3000, () => {
  console.log('Start server at port 3000.')
})