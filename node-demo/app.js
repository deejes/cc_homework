// Step 1: Create project with `yarn init`
// Step 2: Add Express package with `yarn add express`
// Step 3: Create `app.js` file
// Step 4: Require Express in `app.js`
// Step 5: Create a route to serve `/hello/:name`
// Step 6: Have server, app, listen on PORT
// Step 7: Install nodemon & add start script

const express = require('express');
const logger = require('morgan')
const bodyParser = require('body-parser')
const cookieParser = require('cookie-parser')
const path = require('path');
// Calling the express function will create
// an instance of a Express web server
const home = require('./routes/home');
const posts = require('./routes/posts')

const app = express();
// configure our express app to use ejs as our templating engine
app.set('view engine','ejs')
app.use(logger('dev'))
app.use(express.static(path.join(__dirname, 'public')));
// unlike app.get, app.use will match for all https verbs. if we do not give a path aw the first argument,
// it will match for every url
app.use(bodyParser.urlencoded({extended:false}))
app.use(cookieParser())



app.use(function (req, res, next) {
  const {username} = req.cookies;
  // const username = req.cookies.username;

  // All properties of res.local are available as variables
  // inside your views
  res.locals.username = username;
  next();
});

//when use app.use to mount a router file, the first arguemnt is a string that will prefix
// all uri paths defined inside the router file

app.use('/', home);
// app.use('/dashboard',dashboard)

// app.use(function(request,response,next){
//   console.log(`${request.method} - ${request.path} - ${new Date().toString()}`);
//   //next, a function and thirf argument of a middleware callback,
//   // tells express to move on to the next middleware
//   next()
//   // if you dont call next or terminate a response with response.send,
//   // the browser will appear to never stop loading when accessing a url on your server.
// })

// making a part of the relative url begin with :, will make
// that matched section available as data in request.params under a
// property named after the word that follows :.

// URL: http://localhost:4545/hello/:name HTTP VERB: GET

// PORT is uppercased because we intend to be a constant.
// It shouldn't be changed after it's declared.

const PORT = 4545;
app.listen(PORT, () => {
  console.log(`ð¥ Server listening on http://localhost:${PORT}`);
});
