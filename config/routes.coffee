
module.exports = (server, config) ->
  server.get "/", (req, res) ->
    res.render "index"
    
  articles = require('../app/controllers/articles')
  server.get('/articles', articles.list)
  server.post('/articles', articles.create)
  server.get('/articles/:articleId', articles.show)
  server.put('/articles/:articleId', articles.update)
  server.del('/articles/:articleId', articles.destroy)