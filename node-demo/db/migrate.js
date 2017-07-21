const db = require('./index');

db.query(`
  CREATE TABLE posts(
    id SERIAL,
    title VARCHAR(255),
    content TEXT,
    author VARCHAR(255)
  )
`)
  .then(()=>{
    console.log('Created table posts.');
    //process is a global obj provided by node only
    //that gives you access to the running program. We can use it to
    // exit the program, amongst other things.
    process.exit()
  })
  .catch((err)=>{
    console.error(err);
    process.exit()
  })
