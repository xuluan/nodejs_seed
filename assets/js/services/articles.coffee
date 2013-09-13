
#Articles service used for articles REST endpoint
window.app.factory "Articles", ($resource) ->
  console.log "articles factory"
  $resource "articles/:articleId",
    articleId: "@_id"
  ,
    update:
      method: "PUT"