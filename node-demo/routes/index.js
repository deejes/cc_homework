const express = require('express');
const router = express.Router();
const db = require('../db')
// posts#index URL: /posts


router.get('/new',(req,res) =>{
  res.render('posts/new')
})

router.get('/dashboard', function(request,response){
  response.render('dashboard',{dashboard:{}})
})

router.get('/contact', function(request,response){
  // when a form post is parsed by bodyParser its data is formatted as a js object and assigned to the body property
  //of request
  response.render('dashboard')
})
