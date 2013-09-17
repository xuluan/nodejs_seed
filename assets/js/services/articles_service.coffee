
window.app.factory  "Articles", ($resource) ->
  $resource "/articles/:articleId",
    articleId: '@_id'
  ,
    update:
      method: "PUT"
