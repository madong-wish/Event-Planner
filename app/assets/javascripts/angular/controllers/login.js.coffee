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
    else if $scope.createAccountFlag
      alert('Sign up feature is temporarily disabled by Mando. Please contact system admin to resolve this problem.')
    else
      $scope.infoText = 'User does not exist!'
