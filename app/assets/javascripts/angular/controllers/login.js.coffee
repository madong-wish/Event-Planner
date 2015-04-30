app = angular.module("Login", ["ngResource"])

app.factory "User", ($resource) ->
  $resource("/users/:action/:id", {id: "@id"},
    {
      create: { method: 'POST'},
      index: { method: 'GET', isArray: true},
      destroy: { method: 'DELETE'}
      show: { method: 'GET', params: {action: 'show'}, isArray: false}
    }
  )

app.factory "ActiveUser", ($resource) ->
  $resource("/users",
  {
    show: { method: 'GET', isArray: false}
  }
  )

app.controller(@LoginCtrl = ($scope, User, $document) ->
  $scope.users = User.query()
  $scope.createAccountFlag = false
  $scope.passwordReset = false
  $scope.submitText = 'Submit'
  $scope.infoText = 'Please login or sign up'

  $scope.createAccount = () ->
    $scope.createAccountFlag = true
    $scope.submitText = 'Sign Up'
    $scope.infoText = 'Please login or sign up'

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
      User.show({username:$scope.username}
        (data) ->
          unless angular.isUndefined(data.user)
            $scope.infoText = "Fail to Sign Up: Username is taken!"
          else
            newUser = new User({username:$scope.username})
            newUser.password = $scope.password
            newUser.email = $scope.email
            newUser.$save(
              (data) ->
                console.log(data)
                window.location.href = '/events#index'
                $document[0].cookie="username=" + $scope.username + "; expires=Session; path=/"
              (error) ->
                $scope.infoText = "Fail to Sign Up: Email is taken!")
        (error) ->
          console.log(error)
      )
    else
      User.show({username:$scope.username}
        (data) ->
          console.log(data)
          unless angular.isUndefined(data.user)
            if data.user.password == $scope.password
              #$cookieStore.put('activeUser', $scope.username)
              window.location.href = '/events#index'
              console.log($document[0].cookie)
              $document[0].cookie="username=" + $scope.username + "; expires=Session; path=/"
              console.log($document[0].cookie)
            else
              $scope.infoText = 'Incorrect Password!'
          else
            $scope.infoText = 'Username does not exist!'
#          console.log(data['user']['password'])
#          console.log(data.user.password)
        (error) ->
          console.log(error)
      )

  $scope.usernameExist = () ->
    User.show({username:$scope.username}
      (data) ->
        if data
          true
        else
          false
      (error) ->
    )
)