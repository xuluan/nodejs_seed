
module.exports = (server, config) ->
  server.get "/", (req, res) ->
    res.render "index"

  # All partials. This is used by Angular.
  # server.get "/partials/:name", (req, res) ->
  #   name = req.params.name
  #   res.render "partials/" + name
  #   
  # server.get "/articles/:name", (req, res) ->
  #   name = req.params.name
  #   res.render "articles/" + name
  #   
  # 
  # # Views that are direct linkable
  # server.get "/view1", (req, res) ->
  #   res.render "index"
  # 
  # server.get "/view2", (req, res) ->
  #   res.render "index"
    
  articles = require('../app/controllers/articles')
  server.get('/articles', articles.all)
  server.post('/articles', articles.create)
  # server.get('/articles/:articleId', articles.show)
  # server.put('/articles/:articleId', articles.update)
  # server.del('/articles/:articleId', articles.destroy)