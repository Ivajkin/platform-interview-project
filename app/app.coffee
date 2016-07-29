window.WORKFLOW = angular.module 'App', [
  'ngResource',
  'ngRoute',
  'ui.bootstrap',
  'ui.date',
  'ui.router',
  'ui.select2',
  'ui.sortable',
  'angulartics',
  'angulartics.google.analytics',
  'templates']

angular.module('App').controller 'AppController', [ '$scope', ($scope) ->
  $scope.test = 'Brians world'
]
