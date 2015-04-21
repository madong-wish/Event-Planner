app = angular.module("Event", ["ngResource"])


@EventCtrl = ($scope, $rootScope) ->
  $scope.example_events = ["Crab fishing in Sausalito", "Hike in Dry Creek, Hayward", "Walk in Lands End San Francisco", "Visit Tech Museum in San Jose", "Watch movie in Union Landing"]
  $scope.add_event_flag = false
  $scope.username = $rootScope.username

  $scope.addEvent = () ->
    $scope.add_event_flag = true

  $scope.cancelEvent = () ->
    $scope.add_event_flag = false

  $scope.generateSampleEvent = () ->
    $scope.example_events[Math.floor(Math.random()*5)]