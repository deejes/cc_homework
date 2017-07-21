const express = require('express')
const router= express.Router()


router.get('/hello/:name', function (request, response) {
  // This function is named Middleware
  // It's passed the arguments in order: request, response & next
  // - request is an object that contains the entire message from
  //   client. This means http headers, any data its sending, etc.
  // - response is an object that contains the message our server will
  //   reply with to the client. It also contains http headers, our own data, etc.
  const name = request.params.name || 'World';
  response.send(`Hello, ${name}!`);
});

//https://localhost:4545/ http verb: get
router.get('/',function(request,response){
  // response.render - first argument is the location and name of a template we want to render beginning at views/
  response.render('index')
})
//https://localhost:4545/ http verb: get
router.get('/dashboard', function(request,response){
  response.render('dashboard', {tweets:request.cookies.tweetArrkey, test: 4, hey: 785})
  console.log(request.cookies)
})
// tweets:request.cookies.tweetArr

//https://localhost:4545/ http verb: post
router.get('/contact', function(request,response){
  // when a form post is parsed by bodyParser its data is formatted as a js object and assigned to the body property
  //of request
  response.render('contact')
})

let tweetArr = []

router.post('/dashboard', function(req,res){
  // console.log(JSON.stringify(req.body));
  // res.send('response is over')
  // if (!tweetArr ){
  // }
  tweetObj = req.body
  tweetObj['t'] = Date.now()
  // console.log(req.body);
  tweetArr.unshift(tweetObj)
  res.cookie('tweetArrkey', tweetArr ,{maxAge:1000*3600*24})
  res.redirect('/dashboard')

})

// URL : https://localhost:4545/username HTTP Verb:post
router.post('/username',function (req,res) {
    const {username} = req.body
    // this syntax is called desctructuring. its a shortcut for
    // const username = req.body.username
    // res.cookie is a method of cookie-parser. convenient way to set cookies in header of response
    // - first argument is the name
    // - second argument is the value
    // - third and last argument is object to configure cookies
    res.cookie('username',username,{maxAge:1000*3600*24})
    // maxAge decides how long a cookie will last in miliseconds
    res.redirect('/')
    // res.redirect tells the browser, in the response, to go to the given url
})
module.exports = router;
