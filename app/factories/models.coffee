#
# Resource factories shared across app
#

# angular just defaults a save with POST
railsMethods =
  create: method: 'POST'
  update: method: 'PUT'
  copy: method: 'POST', params: verb: 'copy'
  updateAll: method: 'PUT', isArray: true, params: verb: 'bulk_update'

getCampaignId = ($context) ->
  -> $context.getIds().campaignId

getConceptId = ($context) ->
  -> $context.getIds().conceptId

adFormatResource = ($context, $resource) ->
  $resource 'ad_formats/:id/:verb.json'
angular.module('Factories').factory('AdFormat', [ '$context', '$resource', adFormatResource ])

adRevisionResource = ($context, $resource) ->
  $resource 'campaigns/:campaignId/ad_revisions/:id/:verb.json',
    campaignId: getCampaignId($context), _.extend({}, railsMethods)
angular.module('Factories').factory('AdRevision', [ '$context', '$resource', adRevisionResource ])

adTagResource = ($context, $resource) ->
  methods =
    impressions: method: 'GET', params: verb: 'impressions'
    bulkDelete: method: 'POST', params: verb: 'bulk_delete'
    changeTraffickingSheet: method: 'PUT', isArray: true, params: verb: 'bulk_change_trafficking_sheet'
  $resource 'campaigns/:campaignId/ad_tags/:id/:verb.json',
    campaignId: getCampaignId($context), _.extend(methods, railsMethods)
angular.module('Factories').factory('AdTag', [ '$context', '$resource', adTagResource ])

adUnitResource = ($context, $resource) ->
  methods =
    publish:    method: 'PUT', params: verb: 'publish'
    publishAll: method: 'PUT', isArray: true, params: verb: 'publish_all'
  $resource 'campaigns/:campaignId/ad_units/:id/:verb.json',
    campaignId: getCampaignId($context), _.extend(methods, railsMethods)
angular.module('Factories').factory('AdUnit', [ '$context', '$resource', adUnitResource ])

catalogResource = ($context, $resource) ->
  $resource '/admin/catalogs.json', {},
    query:
      method: 'GET',
      params: company_id: $context.getIds().brandId
angular.module('Factories').factory('Catalog', [ '$context', '$resource', catalogResource ])

dataPixelResource = ($context, $resource) ->
  methods =
    query:
      method: 'GET',
      isArray: true
  $resource '/app/data_pixels.json', {}, methods
angular.module('Factories').factory('DataPixel', ['$context', '$resource', dataPixelResource])

campaignAssetResource = ($context, $resource) ->
  $resource 'campaigns/:campaignId/assets/:id.json', {
    id: '@id', campaignId: getCampaignId($context)
  }, railsMethods
angular.module('Factories').factory('CampaignAsset', [ '$context', '$resource', campaignAssetResource ])

campaignFlightsResource = ($context, $resource) ->
  $resource 'analytics/:campaignId/flights/:id.json', { id: '@id', campaignId: getCampaignId($context) }, railsMethods
angular.module('Factories').factory('CampaignFlights', [ '$context', '$resource', campaignFlightsResource ])

campaignConceptsResource = ($context, $resource) ->
  $resource 'analytics/:campaignId/concepts/:id.json', {
    id: '@id',
    campaignId: getCampaignId($context)
  }, railsMethods
angular.module('Factories').factory('CampaignConcepts', [ '$context', '$resource', campaignConceptsResource ])

navigationTabsResource = ($context, $resource) ->
  $resource '/app/navigation_tabs.json'
angular.module('Factories').factory('NavigationTabs', [ '$context', '$resource', navigationTabsResource ])

timezonesResource = ($context, $resource) ->
  $resource 'analytics/time_zones.json', {}, railsMethods
angular.module('Factories').factory('Timezones', [ '$context', '$resource', timezonesResource ])

campaignUnclaimedCreativesResource = ($context, $resource) ->
  $resource 'analytics/:campaignId/unclaimed_creatives/:id.json', {
    id: '@id',
    campaignId: getCampaignId($context)
  }, railsMethods
angular.module('Factories').factory('CampaignUnclaimedCreatives', [ '$context', '$resource', campaignUnclaimedCreativesResource ])

campaignResource = ($context, $resource) ->
  methods =
    delete: method: 'DELETE'
    get: method: 'GET', isArray: false
    myCampaigns: method: 'GET', params: verb: 'my_campaigns'
    copyConcept: method: 'POST', params: verb: 'copy_concept'
  $resource 'campaigns/:id/:verb.json', id: getCampaignId($context), _.extend railsMethods, methods
angular.module('Factories').factory('Campaign', [ '$context', '$resource', campaignResource ])

companyResource = ($context, $resource) ->
  $resource 'companies/:id/:verb.json', id: getCampaignId($context), _.extend railsMethods
angular.module('Factories').factory('Company', [ '$context', '$resource', companyResource ])

angular.module('Factories').factory 'CompanionAd', [ '$context', '$resource', ($context, $resource) ->
  $resource 'campaigns/:campaignId/companion_ads/:id/:verb.json', $context.getIds(), railsMethods
]

angular.module('Factories').factory 'Concept', [ '$context', '$resource', ($context, $resource) ->
  methods =
    preview: method: 'GET'
    query:
      method: 'GET',
      isArray: true
    updateAllTargeting: method: 'PUT', isArray: true, params: verb: 'bulk_update_targeting'

  $resource 'campaigns/:campaignId/concepts/:id/:verb.json', campaignId: getCampaignId($context), _.extend(methods, railsMethods)
]

angular.module('Factories').factory 'ConceptFormat', [ '$context', '$resource', ($context, $resource) ->
  $resource 'concepts/:conceptId/concept_formats/:id/:verb.json', conceptId: getConceptId($context), railsMethods
]

angular.module('Factories').factory 'Container', [ '$context', '$resource', ($context, $resource) ->
  methods =
    updateAll: method: 'PUT', isArray: true, params: verb: 'bulk_update'

  $resource 'campaigns/:campaignId/containers/:id/:verb.json', campaignId: getCampaignId($context), _.extend(methods, railsMethods)

]

containerFlightResource = ($context, $resource) ->
  methods =
    createWithContainers: method: 'POST', params: verb: 'create_with_containers'
    flightCounts: method: 'POST', isArray: true, params: verb: 'counts_with_flights'
  $resource 'campaigns/:campaignId/containers_flights/:id/:verb.json', campaignId: getCampaignId($context), _.extend(methods, railsMethods)
angular.module('Factories').factory('ContainerFlight', [ '$context', '$resource', containerFlightResource ])

angular.module('Factories').factory 'Creative', [ '$context', '$resource', ($context, $resource) ->
  methods =
    associatedImpressions: method: 'GET', params: verb: 'associated_impressions'
    heatMap: method: 'GET', params: verb: 'heat_map'
    postQuery: method:'POST', isArray:true, params: verb: 'index_post'
  $resource 'campaigns/:campaignId/creatives/:id/:verb.json', campaignId: getCampaignId($context), _.extend(methods, railsMethods)
]

delayedJobsResource = ($context, $resource) ->
  methods =
    getStatus: method: 'GET', params: verb: 'status'
  $resource 'delayed_jobs/:id/:verb.json', {}, _.extend({}, methods)
angular.module('Factories').factory('DelayedJob', [ '$context', '$resource', delayedJobsResource ])

# TODO AD clean up the responses here to not return the list of features
featureResource = ($context, $resource) ->
  $resource 'campaigns/:campaignId/features/:id/:verb.json', campaignId: getCampaignId($context),
    create:
      method: 'POST'
      isArray: true
    update:
      method: 'PUT'
      isArray: true
    delete:
      method: 'DELETE'
      isArray: true
    references:
      method: 'GET'
      params: verb: 'references'
angular.module('Factories').factory('Feature', [ '$context', '$resource', featureResource ])

analyticsFeaturesResource = ($context, $resource) ->
  $resource 'analytics/:campaignId/features.json', { campaignId: getCampaignId($context) }
angular.module('Factories').factory('AnalyticsFeatures', [ '$context', '$resource', analyticsFeaturesResource ])

###
  TODO AD for now just refers to 'platform' feeds controller but should just
  build own and use for UI interactions in workflow
###
angular.module('Factories').factory 'Feed', [ '$context', '$resource', ($context, $resource) ->
  $resource '/companies/:brandId/feeds/:id.json', $context.getIds(), railsMethods
]

flashVersionResource = ($resource) ->
  $resource 'flash_versions/:id.json', {}, railsMethods
angular.module('Factories').factory('FlashVersion', [ '$resource', flashVersionResource ])

encodingJobResource = ($resource) ->
  methods =
    summary:
      method: 'GET'
      params:
        verb: 'summary'
    zencodingStatus:
      method: 'GET'
      url: '/api/encoding_jobs/:id/:verb'
      params:
        verb: 'zencoding_status'
  $resource '/api/encoding_jobs/summary.json', {}, methods

angular.module('Factories').factory('EncodingJob', [ '$resource', encodingJobResource ])

flightResource = ($context, $resource) ->
  methods =
    counts:
      method: 'GET'
      params:
        verb: 'counts'
    unauthorized:
      method: 'GET'
      url: '/app/campaigns/:campaignId/flights/:id/:verb.json'
      params:
        verb: 'settings_and_third_party_macros'
  $resource 'campaigns/:campaignId/flights/:id/:verb.json', campaignId: getCampaignId($context), _.extend(methods, railsMethods)
angular.module('Factories').factory('Flight', [ '$context', '$resource', flightResource ])

angular.module('Factories').factory 'Import', [ '$context', '$resource', ($context, $resource) ->
  $resource 'imports/:id/:verb.json', brand_id: (-> $context.getIds().brandId),
    accept: method: 'PUT', params: verb: 'accept'
    parse: method: 'PUT', params: verb: 'parse'
    update: method: 'PUT'
]

angular.module('Factories').factory 'SignalProcessor', [ '$context', '$resource', ($context, $resource) ->
  methods =
    get:
      method: 'GET'
      isArray: false
    connect:
      method: 'PUT'
      params:
        verb: 'connect'
    disconnect:
      method: 'PUT'
      params:
        verb: 'disconnect'
    items:
      method: 'GET'
      isArray: true
      params:
        verb: 'items'
    signals:
      method: 'GET'
      isArray: true
      params:
        verb: 'signals'
    match:
      method: 'GET'
      isArray: true
      params:
        verb: 'match'
    bulkMatch:
      method: 'POST'
      isArray: true
      transformResponse: (response) ->
        newData = []
        try
          newData = JSON.parse response
        catch error
          return console.log error

        newData.map (data) ->
          data._length = data.length
          data

        newData
      params:
        verb: 'bulk_match'
  $resource 'campaigns/:campaignId/signal_processors/:id/:verb.json',
    campaignId: getCampaignId($context),
    _.extend(methods, railsMethods)
]

traffickingSheetResource = ($context, $resource) ->
  $resource 'campaigns/:campaignId/trafficking_sheets/:id.json', campaignId: getCampaignId($context), railsMethods
angular.module('Factories').factory('TraffickingSheet', [ '$context', '$resource', traffickingSheetResource ])

noteResource = ($resource) ->
  $resource 'campaigns/:campaignId/notes/:id.json', {}, railsMethods
angular.module('Factories').factory('Note', [ '$resource', noteResource ])


angular.module('Factories').factory 'Person', [ '$context', '$resource', ($context, $resource) ->
  $resource '/app/people/:id.json', {}, railsMethods
]

angular.module('Factories').factory 'PersonCampaign', [ '$context', '$resource', ($context, $resource) ->
  $resource '/app/campaigns/:campaignId/person_campaigns/:id.json',
    campaignId: getCampaignId($context),
    _.extend railsMethods, get: method: 'GET'
]

angular.module('Factories').factory 'CampaignMessages', [ '$context', '$resource', ($context, $resource) ->
  $resource '/app/campaigns/:campaignId/messages.json',
    campaignId: getCampaignId($context),
    _.extend railsMethods, get: method: 'GET'
]

angular.module('Factories').factory 'CampaignCompanies', [ '$context', '$resource', ($context, $resource) ->
  $resource '/app/campaigns/:campaignId/companies_with_access.json',
    campaignId: getCampaignId($context),
    _.extend railsMethods, get: method: 'GET'
]

angular.module('Factories').factory 'CampaignInvite', [ '$context', '$resource', ($context, $resource) ->
  $resource '/app/campaigns/:campaignId/invites.json',
    campaignId: getCampaignId($context),
    railsMethods
]

angular.module('Factories').factory "ConceptTargeting", [ '$context', '$resource', ($context, $resource) ->
  methods =
    get: method: 'GET'
    delete: method: 'DELETE'
  $resource '/app/campaigns/:campaignId/concept_targetings/:verb.json',
  campaignId: getCampaignId($context),
  _.extend railsMethods, methods
]

angular.module('Factories').factory 'InlineVideo', [ '$context', '$resource', ($context, $resource) ->
  methods =
    create: method: 'POST'
    poll: method: 'GET', params: verb: 'poll'
    cancel: method: 'DELETE', params: verb: 'cancel'
  $resource '/app/campaigns/:campaignId/inline_videos/:verb.json',
  campaignId: getCampaignId($context),
  _.extend railsMethods, methods
]
angular.module('Factories').factory 'CreativeThumbnail', [ '$context', '$resource', ($context, $resource) ->
  methods =
    queue: method: 'POST', params: verb: 'queue'
  $resource '/app/campaigns/:campaignId/creative_thumbnails/:verb.json',
  campaignId: getCampaignId($context),
  _.extend railsMethods, methods
]

angular.module('Factories').factory 'PersonSearch', [ '$context', '$resource', ($context, $resource) ->
  methods =
    get:
      method: 'GET'
      isArray: true
  $resource 'campaigns/:campaignId/invites/person_search.json', campaignId: getCampaignId($context), methods
]

rotationResource = ($resource) ->
  $resource 'campaigns/:campaignId/rotations/:id.json', {}, railsMethods
angular.module('Factories').factory('Rotation', [ '$resource', rotationResource ])

angular.module('Factories').factory 'RotationGroup', [ '$context', '$resource', ($context, $resource) ->
  $resource 'campaigns/:campaignId/rotation_groups/:id/:verb.json', campaignId: getCampaignId($context), railsMethods
]

weightResource = ($context, $resource) ->
  $resource 'campaigns/:campaignId/weights/:id.json', campaignId: getCampaignId($context), railsMethods
angular.module('Factories').factory('Weight', [ '$context', '$resource', weightResource ])

trackingGroupResource = ($resource) ->
  $resource 'campaigns/:campaignId/tracking_groups/:id/:verb.json', {}, railsMethods
angular.module('Factories').factory('TrackingGroup', [ '$resource', trackingGroupResource ])

angular.module('Factories').factory 'LandingPage', [ '$resource', '$context', ($resource, $context) ->
  methods =
    references:
      method: 'POST'
      params: verb: 'references'
    updateReferences:
      method: 'POST'
      params: verb: 'update_references'
    postQuery: method:'POST', isArray:true, params: verb: 'index_post'
  $resource 'campaigns/:campaignId/landing_pages/:id/:verb.json',
    campaignId: getCampaignId($context),
    _.extend(methods, railsMethods)
]

angular.module('Factories').factory 'MasterAsset', [ '$resource', '$context', ($resource, $context) ->
  methods =
    references:
      method: 'GET'
      params: verb: 'references'
  $resource 'campaigns/:campaignId/master_assets/:id/:verb.json',
    campaignId: getCampaignId($context),
    _.extend(methods, railsMethods)
]

angular.module('Factories').factory 'Folder', [ '$resource', '$context', ($resource, $context) ->
  methods =
    create:
      method: 'POST'
    download:
      method: 'GET'
      params: verb: 'download'
    delete:
      method: 'DELETE'
    nestedFolders:
      method: 'GET'
      isArray: true
      params: verb: 'nested_folders', creativeId: '@creativeId'
    update:
      method: 'PUT'
      isArray: true
  $resource 'campaigns/:campaignId/folders/:id/:verb.json?creative_id=:creativeId',
    campaignId: getCampaignId($context),
    _.extend({}, methods)
]

angular.module('Factories').factory 'interceptorForAlerts',['$q', ($q) ->
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

angular.module('Factories').factory 'switchboard', ->
  connect: (line, fn) ->
    @lines ?= {}
    @lines[line] = fn

  isConnected: (line) ->
    !!@lines[line]

  hangup: (line) ->
    @lines?[line] = undefined

  send: (line, data, callback) ->
    @lines?[line]?(data, callback)

angular.module('Factories').factory 'pubSub', ['$timeout', ($timeout) ->
  subs = {}

  publish: (message, data) ->
    (subs[message] || []).forEach (fn) ->
      #  Timout is to work within the angular $digest
      $timeout -> fn.call fn._subContext_, data

  subscribe: (message, fn, context) ->
    me = context || window
    fn._subContext_ = me
    if _.has subs, message
      subs[message].push(fn)
    else
      subs[message] = [fn]

  unsubscribe: (message, fn) ->
    subs[message]?.splice subs[message].indexOf(fn), 1
    delete fn._subContext_
    return true
]

angular.module('Factories').factory 'notificationsBus', ['$timeout', ($timeout) ->
  msg = null
  type = ''
  send: (options = {}) ->
    str = options.message
    time = options.time ? 3000
    errorType = options.type ? ''
    @msg = str
    type = errorType

    unless options.time is false
      $timeout =>
        @msg = null
      , time

  getCurrentType: ->
    type
  getCurrent: ->
    @msg
  removeCurrent: ->
    @msg = null
]

# Helper service to prevent too many requests from deadlocking rails
# Function blocks can be chained with queue()
# fn() is expected to call promiseChain.continue() when it is done
angular.module('Factories').factory 'promiseChain', ['$q', ($q) ->
  chain = []
  started = false

  queue: (fn) ->
    deferred = $q.defer()
    chain.push deferred
    deferred.promise.then ->
      fn()
    @start() if chain.length is 1

  start: ->
    unless started or chain.length is 0
      started = true
      chain.shift().resolve()

  continue: ->
    if chain.length is 0
      started = false
    else
      chain.shift().resolve()
]

# necessary ids stored on root scope but preferably injected where needed
angular.module('Factories').factory '$context', [ '$http', '$rootScope', '$state', ($http, $rootScope, $state) ->

  keys = ['adTagId', 'brandId', 'campaignId', 'conceptId', 'containerId', 'creativeId', 'flightId']
  context = {}
  ids = {}
  oldParams = {}
  _state = $state
  fetched = false

  skipUpdate = (oldParams) ->
    (_state.includes('studio') and _state.params.creativeId is oldParams.creativeId) and fetched

  pickIds = (obj = {}) ->
    _.pick obj, keys

  reset = (newContext = {}) ->
    keys.forEach (k) ->
      $rootScope[k] = null
      ids[k] = null
      context[k] = null
    set newContext

  set = (newContext = {}) ->
    fetched = true

    # TODO clear prior content?
    angular.extend context, newContext
    angular.extend ids, pickIds context
    angular.extend $rootScope, context
    $rootScope.$broadcast('contextChanged')

  $rootScope.$watch (-> $state.params), (params, oldParams) ->
    paramIds = pickIds params
    angular.extend context, paramIds

    # Not necessary to always request the context
    return if skipUpdate(oldParams)

    unless _.isEmpty paramIds
      $http.get 'context.json',
        params: paramIds
      .success set

  getIds: -> ids
  get: -> angular.extend {}, context
  reset: reset
  set: set
]

angular.module('Factories').factory '$baseUrls', [ '$http', '$location', ($http, $location) ->
  urls =
    platform: "http://#{$location.host()}#{if $location.port() is 3000 then ":#{$location.port()}" else ''}"
  $http.get('base_urls.json').success (data) ->
    angular.extend urls, data

  get: (key) -> urls[key]
]

angular.module('Factories').factory '$locationImports', ['$context', 'Import', ($context, Import) ->
  brandId = null
  locations = null
  data: ->
    if brandId is $context.getIds().brandId
      locations
    else
      brandId = $context.getIds().brandId
      locations = Import.query()
]
