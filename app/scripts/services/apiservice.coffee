'use strict'

angular.module('emailClientApp')
  .service 'Apiservice', ["$http",($http) ->
    getAllEmails :()-> $http.get('/firstemaillist')
    getDiffEmails :()-> $http.get('/secondemaillist')
    


]