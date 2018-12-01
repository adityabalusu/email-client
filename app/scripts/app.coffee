'use strict'

angular.module('workSpanApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute',
  'ngMaterial'
  
])
  .config ($routeProvider,$locationProvider) ->
    
    $routeProvider
      .when '/question/:questionID',
        templateUrl: 'views/questionDetails.html'
        controller: 'QuestionCtrl'
      .otherwise
        redirectTo: '/'
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/'
    $locationProvider.hashPrefix("");
  .run () ->
    
   
