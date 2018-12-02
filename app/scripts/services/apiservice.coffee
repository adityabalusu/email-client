'use strict'

angular.module('workSpanApp')
  .service 'Apiservice', ["$http","$q",($http,$q) ->
    questionURL = 'https://api.myjson.com/bins/dck5b'
    answerURL = 'https://api.myjson.com/bins/hildr'
    getAllQuestions :()-> 
      deferredQuestionPromise = $q.defer()
      $http.get(questionURL)
           .then (questions)->
              if questions and questions.data and questions.data.feed_questions
                stringifiedAnswers = JSON.stringify questions.data.feed_questions 
                localStorage.setItem "workSpanQuestions",stringifiedAnswers
                deferredQuestionPromise.resolve questions.data.feed_questions
              else 
                do deferredQuestionPromise.reject 
          .catch ()->
              # Handle rejection
              do deferredQuestionPromise.reject
        
      return deferredQuestionPromise.promise
    getAllAnswers :()-> 
      deferredAnswerPromise = $q.defer()
      $http.get(answerURL)
           .then (answers)->
              if answers and answers.data and answers.data.feed_answers
                stringifiedAnswers = JSON.stringify answers.data.feed_answers
                localStorage.setItem "workSpanAnswers",stringifiedAnswers 
                deferredAnswerPromise.resolve answers.data.feed_answers
              else
                do deferredAnswerPromise.reject
           .catch ()->
              # Handle rejection
              do deferredAnswerPromise.reject
      return deferredAnswerPromise.promise
]