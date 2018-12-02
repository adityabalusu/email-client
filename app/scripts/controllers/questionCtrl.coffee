'use strict'

angular.module('workSpanApp')
  .controller 'QuestionCtrl', ["$scope","Apiservice","$routeParams",($scope,Api,$routeParams) ->
    questionID = $routeParams.questionID
    allquestions = JSON.parse localStorage.getItem 'workSpanQuestions'
    # Iterate through allanswers and find the answers for this question
    getAnswers = (question)->
        allanswers = JSON.parse localStorage.getItem 'workSpanAnswers'
        answers = []
        # Then fetch all answers. 
        if allanswers?  
            # Check if data persists in localstorage. 
            # This is required because we need to preserve the upvotes across pages. 
            for answer in allanswers
                if answer["Question-Id"] is question.Id
                    answers = answers.concat answer
            $scope.answers = answers
        else 
            # no data in localstorage. Fetch new data from API. 
            # Not a good design because of the data can change on server. 
            Api.getAllAnswers()
               .then (answersFromAPI)->
                    for answer in answersFromAPI
                        if answer["Question-Id"] is question.Id
                            answers = answers.concat answer
                    $scope.answers = answers
               .catch ()->
                    # Handle rejection
                    alert("answers api failed from questionDetails page")
    # First fetch the question details. 
    if allquestions?  
        # Check if data persists in localstorage. 
        # This is required because we need to preserve the upvotes across pages. 
        $scope.question = question for question in allquestions when question.Id is questionID
        getAnswers $scope.question
    else 
        # no data in localstorage. Fetch new data from API. 
        # Not a good design because of the data can change on server. 
        Api.getAllQuestions()
           .then (questions)->
                $scope.question = question for question in questions when question.Id is questionID
                getAnswers $scope.question
           .catch ()->
                # Handle rejection
                alert("questions api failed from questionDetails page")
    

    
]   