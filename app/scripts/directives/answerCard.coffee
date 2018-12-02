'use strict'

angular.module('workSpanApp')
  .directive('answerCard', ($interpolate) ->
    templateUrl: 'views/answerCard.html'
    scope:{
      answer:"="
    }
    restrict: 'E'
)