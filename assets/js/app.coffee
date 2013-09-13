"use strict"

# Declare app level module which depends on filters, and services
window.app = angular.module("myApp", ["ui","myApp.filters", "myApp.services", "myApp.directives"]).config [
  "$routeProvider",
  "$locationProvider",
  ($routeProvider, $locationProvider) ->
    $routeProvider.when "/view1",
      templateUrl: "/partials/view1.html"
      controller: MyCtrl1

    $routeProvider.when "/view2",
      templateUrl: "/partials/view2.html"
      controller: MyCtrl2
      
    $routeProvider.when "/articles/new",
      templateUrl: "/partials/articles/new.html"
      

    $routeProvider.otherwise redirectTo: "/view1"
    $locationProvider.html5Mode true
]

