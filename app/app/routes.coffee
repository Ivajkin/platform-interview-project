angular.module('Router').config [ '$locationProvider', ($locationProvider) -> $locationProvider.html5Mode true ]

angular.module('Router').config [ '$stateProvider', 'templatePaths', ($stateProvider, templatePaths) ->

  # TODO roll all states into this abstract parent
  $stateProvider.state 'app',
    controller: 'AppController'
    templateUrl: templatePaths.shared.container
    url: '/workflow'

  # # Admin
  # $stateProvider.state 'admin',
  #   controller: 'AdminController'
  #   controllerUrl: 'app/admin/main'
  #   templateUrl: templatePaths.admin.main
  #   url: '/admin'
  # .state 'admin.encodingJobs',
  #   controller: 'EncodingJobsController'
  #   templateUrl: templatePaths.admin.encodingJobs
  #   url: '/encoding_jobs'
  # .state 'admin.reportFiles',
  #   controller: 'ReportFilesController'
  #   templateUrl: templatePaths.admin.reportFiles
  #   url: '/report_files'
  # .state 'admin.flashVersions',
  #   controller: 'FlashVersionsController'
  #   templateUrl: templatePaths.admin.flashVersions
  #   url: '/flash_versions'
  #
  # # Dashboard
  # $stateProvider.state 'dashboard',
  #   controller: 'DashboardController'
  #   controllerUrl: 'app/dashboard/main'
  #   url: '/dashboard/:campaignId'
  #   templateUrl: templatePaths.workflow.main
  #   resolve:
  #     dataPixels: [ 'DataPixel', (DataPixel) ->
  #       DataPixel.query()
  #     ]
  #     context: [ '$q', '$rootScope', '$stateParams', 'contextService', ($q, $rootScope, $stateParams, contextService) ->
  #       contextService.updateValue 'campaignId', $stateParams.campaignId
  #         .then (status) ->
  #           if not $rootScope.currentPerson?.hasCampaignAccess
  #             $q.reject({ unauthorized: true })
  #           else
  #             status
  #         .catch () ->
  #           $q.reject({ unauthorized: true })
  #     ]
  # $stateProvider.state 'dashboard.insights',
  #   url: '/insights'
  #   views:
  #     header:
  #       controller: 'WorkflowController'
  #       controllerUrl: 'app/workflow/controller'
  #       templateUrl: templatePaths.workflow.header
  #     body:
  #       templateUrl: templatePaths.dashboard.body

]
