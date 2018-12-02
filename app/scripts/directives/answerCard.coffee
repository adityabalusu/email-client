'use strict'

angular.module('workSpanApp')
  .directive('answerCard', ($interpolate) ->
    templateUrl: 'views/answerCard.html'
    restrict: 'E'
    scope:{
      answer:"="
    }
    
)