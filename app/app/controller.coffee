angular.module('Controllers').controller 'AppController', [
  '$scope'
  'Company'
  (
    $scope
    Company
  ) ->
    Company.get(id: 1).$promise
      .then (company) ->
        $scope.test = JSON.stringify company, null, 2
]
