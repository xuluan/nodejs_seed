@ArticlesController = ($scope, Articles) ->
  $scope.articles = Articles.query()
      
  $scope.create = ->
    article= new Articles
      title: @title
      content: @content

    @articles.push article
    article.$save (response) ->
      console.log response

    @title = ""
    @content = ""
    

