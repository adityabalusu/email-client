'use strict'

angular.module('emailClientApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute',
  'selectize'
  'ngMockE2E'
])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/'
  .run ($httpBackend,Fakebackend) ->
    # passThrough to prevent intereference of $httpBackend.flush() with ngRoute. 
    $httpBackend.whenGET(/\.html$/).passThrough();
    do Fakebackend.setup
