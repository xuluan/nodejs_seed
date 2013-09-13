@ArticlesController = ($scope, $routeParams, $location, Articles) ->

  $scope.create = ->
    article = new Articles
      title: @title
      content: @content

    # article.$save (response) ->
    #   $location.path "articles/" + response._id

    @title = ""
    @content = ""

#angular.module('myApp').controller 'ArticlesController', ArticlesController