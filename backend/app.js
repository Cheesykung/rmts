// require package
const express = require('express')

// create instance
const app = express()

// config format
app.use(express.json()) // for parsing application/json
app.use(express.urlencoded({ extended: true })) // for parsing application/x-www-form-urlencoded

//router
const searchRouter = require('./api/searchAPI')

// register router
app.use(searchRouter.router)

// open port
app.listen(3000, () => {
  console.log('Start server at port 3000.')
})