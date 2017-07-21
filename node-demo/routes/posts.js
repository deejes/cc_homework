const express = require('express');
const router = express.Router();
const db = require('../db')
// posts#index URL: /posts


router.get('/new',(req,res) =>{
  res.render('posts/new')
})
router.get('/dashboard',(req,res) =>{
  res.render('dashboard')
})

router.post('/', (req, res) => {
  const post = req.body
  console.log(post)

  db.query(`
    INSERT INTO posts (title, content, author) VALUES ($<title>, $<content>, $<author>)
  `, post
  ).then(() => {
    res.redirect('/posts')
  }).catch(error => {
    res.send(error)
  })
})


router.get('/',(req,res) => {
  db.query(
    `SELECT * FROM posts ORDER BY id DESC`)
    .then(posts =>{
      res.render('posts/index',{posts:posts});
    })
})



// posts#show URL: /posts/:id HTTP VERB GET

router.get('/:id',(req,res)=>{
  const {id} = req.params;
  db.one(
    `select * from posts WHERE id = $<id> LIMIT 1`
  , {id:id})

  .then(post => {
    res.render('posts/show', {post:post})
  })
  .catch(err => res.send(err))
})

module.exports = router;
