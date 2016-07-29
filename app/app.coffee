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
  'Constants',
  'Controllers'
  'Factories'
  'Router'
  'templates']

angular.module('App').factory 'interceptorForAlerts',['$q', ($q) ->
  requests = {}
  count = 0
  handleRequest = (config) ->
    if config.params?.alertOnBeforeunload
      config.requestNum = count
      callback = (e) ->
        e.returnValue = "Your updates are still being processed. Please don't navigate away from this page for a few more moments to avoid data integrity issues."
        e.returnValue

      requests[count] = callback
      count += 1

      $(window).on 'beforeunload', callback

    config

  handleResponse = (response) ->
    if response?.config?.params?.alertOnBeforeunload
      $(window).off 'beforeunload', requests[response.config.requestNum]
    response

  handleError = (rejection) ->
    if rejection?.config?.params?.alertOnBeforeunload
      $(window).off 'beforeunload', requests[rejection.config.requestNum]
    $q.reject rejection

  request: handleRequest
  requestError: handleError
  response: handleResponse
  responseError: handleError
]

angular.module('App').config ['$httpProvider', ($httpProvider) ->
  $httpProvider.interceptors.push 'interceptorForAlerts'
]
