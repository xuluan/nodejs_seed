
module.exports = (server, config, passport, auth) ->
  users = require('../app/controllers/users')
  server.get('/signin', users.signin)
  server.get('/signup', users.signup)
  server.get('/signout', users.signout)
  
  server.get "/", (req, res) ->
    res.render "index"
    
  articles = require('../app/controllers/articles')
  server.get('/articles', articles.list)
  server.post('/articles', articles.create)
  server.get('/articles/:articleId', articles.show)
  server.put('/articles/:articleId', articles.update)
  server.del('/articles/:articleId', articles.destroy)