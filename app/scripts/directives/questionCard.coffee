'use strict'

angular.module('workSpanApp')
  .directive('questionCard', ($interpolate) ->
    templateUrl: 'views/questionCard.html'
    scope:{
      question:"="
    }
    restrict: 'E'
    controller: ($scope) ->
      $scope.upvote = (question)->
           if question.upvotes? then question.upvotes++ else question.upvotes = 1
          ### 
          # Use the below block if data needs to persisted.
          ###
          ###
          allquestions = JSON.parse localStorage.getItem "workSpanQuestions"
          for item in allquestions 
            if item.Id is question.Id 
              if item.upvotes? then item.upvotes++ else item.upvotes = 1
              $scope.question = item
          localStorage.setItem "workSpanQuestions", JSON.stringify allquestions
          ###

      $scope.downvote = (question)->
          if question.downvotes? then question.downvotes-- else question.downvotes = 1
          
          ### 
          # Use the below block if data needs to persisted.
          ###
          ###
          allquestions = JSON.parse localStorage.getItem "workSpanQuestions"
          for item in allquestions 
            if item.Id is question.Id 
              if item.downvotes? then item.downvotes-- else item.downvotes = 1
              $scope.question = item
          localStorage.setItem "workSpanQuestions", JSON.stringify allquestions
          ###
            


      



      
      
            
      
)
