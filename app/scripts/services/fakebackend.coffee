'use strict'

angular.module('emailClientApp')
  .service 'Fakebackend', ["$httpBackend","$http",($httpBackend,$http) ->
    fakeAPI = {}
    allEmails = [
      {
        email: 'test3@gmail.com'
        displayName: 'Yet another'
        imgURL:"https://randomuser.me/api/portraits/men/1.jpg"
        frequency:1000
        lastUsed: 1470943321338
      
      }
      {
        email: 'test2@gmail.com'
        displayName: 'This is another test'
        imgURL:"https://randomuser.me/api/portraits/men/1.jpg"
        frequency:1000
        lastUsed: 1470943321338
      
      }
      {
        email: 'test@gmail.com'
        displayName: 'This is a test'
        imgURL:"https://randomuser.me/api/portraits/men/1.jpg"
        frequency:1000
        lastUsed: 1470943321338
      
      }
      {
        email: 'barack.obama@personal.com'
        displayName: 'Barack Obama'
        imgURL:"https://randomuser.me/api/portraits/men/2.jpg"
        frequency:500
        lastUsed: 1470935921348
      }
      {
        email: 'donald.trump@usa.gov'
        displayName: 'Donald Trump'
        imgURL:"https://randomuser.me/api/portraits/men/3.jpg"
        frequency:100
        lastUsed: 1470943411667
      }
      {
        email: 'barack.obama@usa.gov'
        displayName: 'Barack Obama'
        imgURL:"https://randomuser.me/api/portraits/men/4.jpg"
        frequency:1000
        lastUsed: 1470807000000
      }
      {
        email: 'jd@example.com'
        displayName: 'Doe,John'
        imgURL:"https://randomuser.me/api/portraits/men/5.jpg"
        frequency:1000
        lastUsed: 1470843000000
      }
    ]
    diffEmails = [
      {
        email: 'foo@example.com'
        displayName: 'Test1 Example'
        imgURL:"https://randomuser.me/api/portraits/men/1.jpg"
        frequency:1000
        lastUsed: 1470943321338
      
      }
      {
        email: 'bar@example.com'
        displayName: 'Test2 Example'
        imgURL:"https://randomuser.me/api/portraits/men/1.jpg"
        frequency:1000
        lastUsed: 1470943321338
      
      }
      {
        email: 'baz@gmail.com'
        displayName: 'Test3 Gmail'
        imgURL:"https://randomuser.me/api/portraits/men/1.jpg"
        frequency:1000
        lastUsed: 1470943321338
      
      }
      {
        email: 'foobar@gmail.com'
        displayName: 'Test4 Gmail'
        imgURL:"https://randomuser.me/api/portraits/men/2.jpg"
        frequency:500
        lastUsed: 1470935921348
      }
    ]
    fakeAPI.setup = () ->
        $httpBackend.whenGET("/firstemaillist").respond(allEmails)
        $httpBackend.whenGET("/secondemaillist").respond(diffEmails)
    fakeAPI


]