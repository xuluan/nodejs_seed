@ArticlesController = ($scope, $routeParams, $location, Articles) ->
  $scope.articles = Articles.query()
  console.log $scope.articles
      
  $scope.create = ->
    article= new Articles
      title: @article.title
      content: @article.content

    @articles.push article
    article.$save (response) ->
      console.log response._id
      $location.path("articles/")

    @article.title = ""
    @article.content = ""
    
  $scope.findOne = ->
    Articles.get
      articleId: $routeParams.articleId
    , (article) ->
      $scope.article = article

  $scope.update = ->
    article = $scope.article
    article.$update ->
      $location.path 'articles/'


  $scope.remove = (idx)->
    return unless confirm("Do you want to remove it?")
    article = $scope.articles[idx]
    article.$delete (response) ->
      console.log response
      
    $location.path("articles/")
