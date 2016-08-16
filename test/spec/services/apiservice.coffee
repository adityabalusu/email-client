'use strict'

describe 'Service: apiService', () ->

  # load the service's module
  beforeEach module 'emailClientApp'

  # instantiate service
  apiService = {}
  beforeEach inject (_apiService_) ->
    apiService = _apiService_

  #it 'should do something', () ->
   # expect(!!apiService).toBe true
