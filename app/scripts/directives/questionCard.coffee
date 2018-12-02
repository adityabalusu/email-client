'use strict'

angular.module('workSpanApp')
  .directive('questionCard', ($interpolate) ->
    templateUrl: 'views/questionCard.html'
    scope:{
      question:"="
      answersAvailable:"="
    }
    restrict: 'E'
    controller: ($scope) ->
      $scope.upvote = (question)->
          # Use only the below line if you dont want persistent data from localStorage
          # if question.upvotes? then question.upvotes++ else question.upvotes = 1

          allquestions = JSON.parse localStorage.getItem "workSpanQuestions"
          for item in allquestions 
            if item.Id is question.Id 
              if item.upvotes? then item.upvotes++ else item.upvotes = 1
              $scope.question = item
          localStorage.setItem "workSpanQuestions", JSON.stringify allquestions
          

      $scope.downvote = (question)->
          # Use only the below line if you dont want persistent data from localStorage
          # if question.downvotes? then question.downvotes-- else question.downvotes = 1
          allquestions = JSON.parse localStorage.getItem "workSpanQuestions"
          for item in allquestions 
            if item.Id is question.Id 
              if item.downvotes? then item.downvotes-- else item.downvotes = 1
              $scope.question = item
          localStorage.setItem "workSpanQuestions", JSON.stringify allquestions
)
