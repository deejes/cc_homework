const express = require('express');

// Calling the express function will create
// an instance of a Express web server
const app = express();

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
