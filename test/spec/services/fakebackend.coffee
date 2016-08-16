'use strict'

describe 'Service: fakeBackEnd', () ->

  # load the service's module
  beforeEach module 'emailClientApp'

  # instantiate service
  fakeBackEnd = {}
  beforeEach inject (_fakeBackEnd_) ->
    fakeBackEnd = _fakeBackEnd_

  #it 'should do something', () ->
  #  expect(!!fakeBackEnd).toBe true
