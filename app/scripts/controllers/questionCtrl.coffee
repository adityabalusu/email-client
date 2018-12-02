'use strict'

angular.module('workSpanApp')
  .controller 'QuestionCtrl', ["$scope","Apiservice","$routeParams",($scope,Api,$routeParams) ->
    questionID = $routeParams.questionID
    allquestions = JSON.parse localStorage.getItem 'workSpanQuestions'
    allanswers = JSON.parse localStorage.getItem 'workSpanAnswers'
    $scope.user = {}
    ### 
     getAnswers fetches all the answers and iterates through them  
     and finds the answers for this question
    ###
    getAnswers = (question)->
        answers = []
        # Then fetch all answers. 
        if allanswers?  
            # Check if data persists in localStorage. 
            # This is required because we need to preserve the upvotes across pages. 
            for answer in allanswers
                if answer["Question-Id"] is question.Id
                    answers = answers.concat answer
            $scope.answers = answers
        else 
            # No data in localStorage. Fetch new data from API. 
            # Not a good design because the data can change on server. 
            Api.getAllAnswers()
               .then (answersFromAPI)->
                    for answer in answersFromAPI
                        if answer["Question-Id"] is question.Id
                            answers = answers.concat answer
                    $scope.answers = answers
               .catch ()->
                    # Handle rejection
                    alert("answers api failed from questionDetails page")
    ### 
     addAnswer adds a new answer for this question
     and pushes it to localstorage
    ###
    $scope.addAnswer = ()->
        currentAnswerState = JSON.parse localStorage.getItem "workSpanAnswers"
        answerId = currentAnswerState.length+1
        current_time = moment()
        answerToAdd =
            "Question-Id":questionID
            "Id":"A-"+answerId
            "Answer":$scope.user.newAnswer
            "created_by":
                "Name":"Aditya"
                "Surname":"Balusu"
                "Avatar":"https://randomuser.me/api/portraits/men/87.jpg"
            "created_at":current_time.format("DD/MMM/YY HH:mm")
        $scope.answers.push answerToAdd
        currentAnswerState.push answerToAdd
        localStorage.setItem "workSpanAnswers",JSON.stringify currentAnswerState
        
    $scope.orderByDate = (item)-> 
        if item.created_at?
            return new Date(item.created_at)

    ###
    # Business logic starts here.
    ###
    
    # Fetch the question details. 
    if allquestions?  
        # Check if data persists in localStorage. 
        # This is required because we need to preserve the upvotes across pages. 
        $scope.question = question for question in allquestions when question.Id is questionID
        getAnswers $scope.question
    else 
        # No data in localStorage. Fetch new data from API. 
        # Not a good design because the data can change on server. 
        Api.getAllQuestions()
           .then (questions)->
                $scope.question = question for question in questions when question.Id is questionID
                getAnswers $scope.question
           .catch ()->
                # Handle rejection
                alert("questions api failed from questionDetails page")
]   