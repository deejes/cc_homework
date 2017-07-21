const pgp = require('pg-promise')();
const db = pgp({
  host: 'localhost',
  database: 'exp_dev',
  user: "dj",
  password:"test"
})


module.exports = db
