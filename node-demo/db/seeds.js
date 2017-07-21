const faker = require('faker');
const db = require('./index');

db.query(`
  INSERT INTO posts(title,content,author)
  VALUES($<title>,$<content>,$<author>)
  `, {title:faker.hacker.noun(),
    content:faker.hacker.phrase(),
    author:faker.name.findName()
  })

  .then(()=>{
    console.log('created a post');
    process.exit();

  })
