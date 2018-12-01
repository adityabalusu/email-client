'use strict'

angular.module('workSpanApp')
  .service 'Apiservice', ["$http","$q",($http,$q) ->
    getAllQuestions :()-> 
      deferredQuestionPromise = $q.defer()
      questionURL = 'https://api.myjson.com/bins/dck5b'
      $http.get(questionURL)
           .then (questions)->
              if questions and questions.data and questions.data.feed_questions
                ### 
                # Use the below block if data needs to persisted
                ###
                #stringifiedAnswers = JSON.stringify questions.data.feed_questions 
                #localStorage.setItem "workSpanQuestions",stringifiedAnswers
                do deferredQuestionPromise.resolve questions.data.feed_questions
              else 
                do deferredQuestionPromise.reject 
          .catch ()->
              # Handle rejection
              do deferredQuestionPromise.reject
        
      return deferredQuestionPromise.promise
    getAllAnswers :()-> 
      deferredAnswerPromise = $q.defer()
      answerURL = 'https://api.myjson.com/bins/hildr'
      $http.get(answerURL)
           .then (answers)->
              if answers and answers.data and answers.data.feed_answers
                ### 
                # Use the below block if data needs to persisted
                ###
                #stringifiedAnswers = JSON.stringify answers.data.feed_answers
                #localStorage.setItem "workSpanAnswers",stringifiedAnswers 
                do deferredAnswerPromise.resolve answers.data.feed_answers
              else
                do deferredAnswerPromise.reject
           .catch ()->
              # Handle rejection
              do deferredAnswerPromise.reject
      
]