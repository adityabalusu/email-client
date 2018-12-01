'use strict'

angular.module('workSpanApp')
  .controller 'MainCtrl', ["$scope","Apiservice",($scope,Api) ->
    # Getting all questions
    Api.getAllQuestions()
       .then (questions)->
          ### 
          # Use the below block if data needs to persisted
          ###
          #questionsString = localStorage.getItem "workSpanQuestions"
          #$scope.questions = JSON.parse questionsString 

          $scope.questions = questions
       .catch () ->
          # Handle rejection
          alert("question api failed")
        

    # Getting all answers
    Api.getAllAnswers()
       .then (answers)->
          ### 
          # Use the below block if data needs to persisted
          ###
          #answersString = localStorage.getItem "workSpanAnswers"
          #$scope.answers = JSON.parse answersString

          $scope.answers = answers
       .catch ()->
          # Handle rejection
          alert("answer api failed")
    

    
]