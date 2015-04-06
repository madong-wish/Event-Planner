@LoginCtrl = ($scope) ->

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