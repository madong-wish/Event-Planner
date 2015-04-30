app = angular.module("Event", ["ngResource"])


app.controller(@EventCtrl = ($scope, $document) ->
  $scope.example_events = ["Crab fishing in Sausalito", "Hike in Dry Creek, Hayward", "Walk in Lands End San Francisco", "Visit Tech Museum in San Jose", "Watch movie in Union Landing"]
  $scope.add_event_flag = false
  console.log($document[0].cookie)
  unless angular.isUndefined($document[0].cookie)
    $scope.username = $document[0].cookie.split('username=')[1].split(';')[0]
  console.log($scope.username)

  $scope.addEvent = () ->
    $scope.add_event_flag = true

  $scope.cancelEvent = () ->
    $scope.add_event_flag = false

  $scope.generateSampleEvent = () ->
    unless $scope.add_event_flag
      $scope.example_events[Math.floor(Math.random()*5)]
)