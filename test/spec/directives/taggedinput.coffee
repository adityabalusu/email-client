'use strict'

describe 'Directive: taggedInput', () ->

  # load the directive's module
  beforeEach module 'emailClientApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<tagged-input></tagged-input>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the taggedInput directive'
