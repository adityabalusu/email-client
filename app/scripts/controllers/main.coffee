'use strict'

angular.module('workSpanApp')
  .controller 'MainCtrl', ["$scope","Apiservice",($scope,Api) ->
    # Getting all questions
    Api.getAllQuestions()
       .then (questions)->
          $scope.questions = questions
       .catch () ->
          # Handle rejection
          alert("questions api failed")

          
    # Getting all answers
    Api.getAllAnswers()
       .then (answers)->
          $scope.answers = answers
       .catch ()->
          # Handle rejection
          alert("answers api failed")
    
    $scope.countAnswers = (question) ->
         # count all answers are available for a given question
         count = 0
         if $scope.answers
            for answer in $scope.answers 
               if answer["Question-Id"] is question.Id
                  count++
         return count
          
         

         
]