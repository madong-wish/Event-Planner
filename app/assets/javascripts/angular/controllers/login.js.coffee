app = angular.module("Login", ["ngResource"])

app.factory "User", ($resource) ->
  $resource("/users/:id", {id: "@id"},
    {
      'create': { method: 'POST'},
      'index': { method: 'GET', isArray: true},
      'show': { method: 'GET', isArray: false},
      'destroy': { method: 'DELETE'}
    }
  )

@LoginCtrl = ($scope, User) ->
  $scope.users = User.query()

  $scope.createAccountFlag = false
  $scope.passwordReset = false
  $scope.submitText = 'Submit'
  $scope.infoText = 'Please login or sign up'

  $scope.createAccount = () ->
    $scope.createAccountFlag = true
    $scope.submitText = 'Sign Up'

  $scope.backToLogin = () ->
    $scope.createAccountFlag = false
    $scope.passwordReset = false
    $scope.submitText = 'Submit'
    $scope.infoText = 'Please login or sign up'

  $scope.resetPassword = () ->
    $scope.passwordReset = true
    $scope.infoText = 'Please enter your email to retrieve password'


  $scope.submitForm = () ->
    if $scope.passwordReset
      $scope.backToLogin()
      $scope.infoText = 'An email has been sent to you with password reset link'
    else if $scope.createAccountFlag
      newUser = new User({username:$scope.username})
      newUser.password = $scope.password
      newUser.$save(
        (data) ->
          data.email = $scope.email
          data.$save(
            (data) ->
              console.log(data)
            (error) ->
              console.log(error)
              $scope.infoText = "Fail to Sign Up: Email is taken!"
          )
        (error) ->
          console.log(error)
          $scope.infoText = "Fail to Sign Up: Username is taken!"
      )


    else
      user = User.get({username:$scope.username})
      if user.isUndefined()
        $scope.infoText = 'User does not exist!'
      else
        if $scope.password != user.password
          $scope.infoText = 'Password does not match our records!'
        else
          $scope.infoText = 'Success'