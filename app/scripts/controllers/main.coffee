'use strict'

angular.module('emailClientApp')
  .controller 'MainCtrl', ["$scope","Apiservice",($scope,Api) ->
    $scope.emails
    $scope.emailsCC
    
    # email dropdown for first taggedInputBox
    Api.getAllEmails().then (allEmails)->
        if allEmails and allEmails.data
            $scope.emailsOptions = allEmails.data
        

    # email dropdown for second taggedInputBox
    Api.getDiffEmails().then (diffEmails)->
        if diffEmails and diffEmails.data
            $scope.emailsOptions2 = diffEmails.data
        
]