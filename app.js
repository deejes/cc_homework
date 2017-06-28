// Step 1: Create project with `yarn init`
// Step 2: Add Express package with `yarn add express`
// Step 3: Create `app.js` file
// Step 4: Require Express in `app.js`
// Step 5: Create a route to serve `/hello/:name`
// Step 6: Have server, app, listen on PORT
// Step 7: Install nodemon & add start script

const express = require('express');
const logger = require('morgan');

// Calling the express function will create
// an instance of a Express web server
const app = express();

// unlike app.get, app.use will match for all HTTP verbs
// If we do not give a path as the first argument, it will match for
// every URL
/*
app.use(function (request, response, next) {
  console.log(`📝 ${request.method} – ${request.path} – ${new Date().toString()}`);
  // next, a function and third argument of a middleware callback,
  // express to move on to the next middleware
  next();
  // If you do not call next, or terminate a response with response.send,
  // the browser will appear to never stop loading when accessing a URL
  // on your server
});
*/

app.use(logger('dev'));

// making a part of the relative url begin with :, will make
// that matched section available as data in request.params under a
// property named after the word that follows :.

// URL: http://localhost:4545/hello/:name HTTP VERB: GET
app.get('/hello/:name', function (request, response) {
  // This function is named Middleware
  // It's passed the arguments in order: request, response & next
  // - request is an object that contains the entire message from
  //   client. This means http headers, any data its sending, etc.
  // - response is an object that contains the message our server will
  //   reply with to the client. It also contains http headers, our own data, etc.
  const name = request.params.name || 'World';
  response.send(`Hello, ${name}!`);
});

// PORT is uppercased because we intend to be a constant.
// It shouldn't be changed after it's declared.
const PORT = 4545;
app.listen(PORT, () => {
  console.log(`🖥 Server listening on http://localhost:${PORT}`);
});
