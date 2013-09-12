
module.exports = (server, config) ->
  server.get "/", (req, res) ->
    res.render "index"

  # All partials. This is used by Angular.
  server.get "/partials/:name", (req, res) ->
    name = req.params.name
    res.render "partials/" + name

  # Views that are direct linkable
  server.get "/view1", (req, res) ->
    res.render "index"

  server.get "/view2", (req, res) ->
    res.render "index"