"use strict"

myApp = angular.module 'myApp', ['ngResource']
window.app = myApp
myApp.config ($routeProvider, $locationProvider) ->
  $routeProvider.when "/view1",
    templateUrl: "/partials/view1.html"
    controller: MyCtrl1

  $routeProvider.when "/view2",
    templateUrl: "/partials/view2.html"
    controller: MyCtrl2
      
  $routeProvider.when "/articles/new",
    templateUrl: "/partials/articles/new.html"
    controller: ArticlesController
    
  $routeProvider.when "/articles",
    templateUrl: "/partials/articles/all.html"
    controller: ArticlesController
    
  $routeProvider.when "/articles/:articleId/edit",
    templateUrl: "/partials/articles/edit.html"
    controller: ArticlesController
 
  $routeProvider.when "/articles/:articleId/",
    templateUrl: "/partials/articles/show.html"
    controller: ArticlesController

            
  $routeProvider.otherwise redirectTo: "/articles"
