#
# Rails Constants (primarily asset paths) go here as single .erb file
#
angular.module('Constants', [])

angular.module('Constants').constant 'imagePaths',

  general:
    lil:  "lil.gif"
    spongecellLogo:  "shared/spongecell-logo.png"
  studio:
    mediaCarouselNavGuide:
      right: "studio/ad_builder/thumbnail_origin_right.png"
      left: "studio/ad_builder/thumbnail_origin_left.png"
      center: "studio/ad_builder/thumbnail_origin_horizontal_center.png"
      middle: "studio/ad_builder/thumbnail_origin_vertical_center.png"
      top: "studio/ad_builder/thumbnail_origin_top.png"
      bottom: "studio/ad_builder/thumbnail_origin_bottom.png"
    closeButton:
      upState: "app/assets/images/studio/ads/elements/SC_CloseBtn_up.png"
      overState: "app/assets/images/studio/ads/elements/SC_CloseBtn_over.png"
      downState: "app/assets/images/studio/ads/elements/SC_CloseBtn_down.png"
    prevArrow:
      upState: "app/assets/images/studio/ads/elements/SC_LeftArrow_up.png"
      overState: "app/assets/images/studio/ads/elements/SC_LeftArrow_over.png"
    nextArrow:
      upState: "app/assets/images/studio/ads/elements/SC_RightArrow_up.png"
      overState: "app/assets/images/studio/ads/elements/SC_RightArrow_over.png"
  preview:
    demo:
      wrapperBackground: "app/assets/images/preview/demo/AgrocragBlueBackground.png"
    devices:
      iPhone6: "preview/devices/iPhone 6.png"
      iPhone5s: "preview/devices/iPhone 5s.png"
  workflow:
    missingImageLarge: "workflow/missing_image_large.png"
    missingImageSmall: "workflow/missing_image_small.png"
    uploadImage: "workflow/upload_image.png"
    userAvatar: "workflow/user_avatar.png"


angular.module('Constants').constant 'templatePaths',

  admin:
    main:           "admin/main.html"
    encodingJobs:   "admin/encoding-jobs.html"
    reportFiles:    "admin/report-files.html"
    flashVersions:  "admin/flash-versions.html"
  components:
    checkBox: "components/check-box.html"
    searchDropdown: "components/search-dropdown.html"
    flightFilterDropdown: "components/flight-filter-dropdown.html"
  dashboard:
    body:               "dashboard/body.html"
    components:
      campaign:
        team:      "dashboard/components/campaign/team.html"
        assetList: "dashboard/components/campaign/asset-list.html"
        assetRow:  "dashboard/components/campaign/asset-row.html"
      kpiRow:            "dashboard/components/kpi-row.html"
      kpiStats:          "dashboard/components/kpi-stats.html"
      kpiContainer:      "dashboard/components/kpi-container.html"
      graph:             "dashboard/components/graph.html"
      dataBubble:        "dashboard/components/data-bubble.html"
      featuresList:      "dashboard/components/features-list.html"
      featuresRow:       "dashboard/components/features-row.html"
      signalProcessors:  "dashboard/components/signal-processors.html"
      spListItem:        "dashboard/components/sp-list-item.html"
      teamPerson:        "dashboard/components/team-person.html"
      invite:            "dashboard/components/invite.html"
      signalProcessorModal: "dashboard/components/sp-copy.html"
      creativeRow:       "dashboard/components/creative-row.html"
      pendingCreativeRow:   "dashboard/components/pending-creative-row.html"
      conceptsView:      "dashboard/components/concepts-view.html"
      conceptsRow:       "dashboard/components/concepts-row.html"
      conceptsHeader:    "dashboard/components/concepts-header.html"
      mediaView:         "dashboard/components/media-view.html"
      mediaRow:          "dashboard/components/media-row.html"
      mediaHeader:       "dashboard/components/media-header.html"
      unclaimedCreativesView: "dashboard/components/unclaimed-creatives-view.html"
  shared:
    breadcrumbs:  "shared/breadcrumbs.html"
    companion:    "shared/companion-modal.html"
    feature:    "shared/feature-form.html"
    locations:    "shared/locations.html"
    container:    "shared/container.html"
    notes:        "shared/notes.html"
    copyConcept:  "shared/copy-concept-modal.html"
    popover:      "shared/learn-more-popover.html"
  studio:
    main:         "studio/main.html"
    navigation:   "studio/nav.html"
    actions:    "studio/actions.html"
    main:       "studio/main.html"
    backup:
      settings: "studio/backup/settings.html"
    canvas:     "studio/canvas.html"
    components:
      canvas:
        scCanvasElement:     "studio/components/canvas/sc-canvas-element.html"
      locations:
        studioLocations:     "studio/components/locations/studio-locations.html"
      nav:
        backupContent:       "studio/components/nav/backup-content.html"
        layoutContent:       "studio/components/nav/layout-content.html"
        screenContent:       "studio/components/nav/screen-content.html"
        screenElement:       "studio/components/nav/screen-element.html"
      properties:
        elementContent:      "studio/components/properties/element-content.html"
      settings:
        settingsContent:     "studio/components/settings/settings-content.html"
      dimensionFields:       "studio/components/dimension-fields.html"
      elementMetadata:       "studio/components/element-metadata.html"
      elementIcon:           "studio/components/element-icon.html"
      inlineUpdateField:     "studio/components/inline-update-field.html"
      inlineVideo:           "studio/components/sc-inline-video.html"
      positionFields:        "studio/components/position-fields.html"
      responsiveImage:       "studio/components/responsive-image.html"
      scAddElementBtn:       "studio/components/sc-add-element-btn.html"
      scProgressBar:         "studio/components/sc-progress-bar.html"
      scStudioHeader:        "studio/components/sc-studio-header.html"
      scStudioFooter:        "studio/components/sc-studio-footer.html"
      sectionToggle:         "studio/components/section-toggle.html"
      studioDropdown:        "studio/components/studio-dropdown.html"
      transitionSettings:    "studio/components/transition-settings.html"
    customCss:
      main: "studio/custom-css/main.html"
      components:
        scCustomCss: "studio/custom-css/components/sc-custom-css.html"
    addElement:
      main: "studio/add-element/main.html"
      components:
        scAddElement:"studio/add-element/components/sc-add-element.html"
    conceptNav:
      main: "studio/concept-nav/main.html"
      components:
        scStudioConceptNav: "studio/concept-nav/components/sc-studio-concept-nav.html"
    elements:
      nav:          "studio/elements/nav.html"
      components:
        anchoredElement: "studio/elements/components/sc-anchored-element.html"
        itemPicker: "studio/elements/components/sc-item-picker.html"
        interactionFields: "studio/elements/components/interaction-fields.html"
      locations:
        main:              "studio/elements/locations/main.html"
      properties:
        main:              "studio/elements/properties/main.html"
        element:
          animation:       "studio/elements/properties/element/animation.html"
          cssButton:       "studio/elements/properties/element/css-button.html"
          customButton:    "studio/elements/properties/element/custom-button.html"
          custom:          "studio/elements/properties/element/custom.html"
          hitArea:         "studio/elements/properties/element/hit-area.html"
          image:           "studio/elements/properties/element/image.html"
          responsiveImage: "studio/elements/properties/element/responsive-image.html"
          map:             "studio/elements/properties/element/map.html"
          mediaCarousel:   "studio/elements/properties/element/media-carousel.html"
          text:            "studio/elements/properties/element/text.html"
          thumbnail:       "studio/elements/properties/element/thumbnail.html"
          siteWindow:      "studio/elements/properties/element/site-window.html"
          video:           "studio/elements/properties/element/video.html"
      settings:
        main:              "studio/elements/settings/main.html"
        animation:         "studio/elements/settings/animation.html"
        map:               "studio/elements/settings/map.html"
        mediaCarousel:     "studio/elements/settings/media-carousel.html"
        video:             "studio/elements/settings/video.html"
    manager:
      list: "studio/manager/manager-list.html"
      assets:
        components:
          assetManager:        "studio/manager/assets/components/asset-manager.html"
          scAsset:              "studio/manager/assets/components/sc-asset.html"
          scFolder:            "studio/manager/assets/components/sc-folder.html"
          scFolderBreadcrumbs: "studio/manager/assets/components/sc-folder-breadcrumbs.html"
        main: "studio/manager/assets/main.html"
        move:
          components:
            folderAccordion: "studio/manager/assets/move/components/folder-accordion.html"
            folderMove: "studio/manager/assets/move/components/folder-move.html"
          main: "studio/manager/assets/move/main.html"
      conceptSettings:
        components:
          conceptSettingsManager: "studio/manager/concept-settings/components/concept-settings-manager.html"
        main: "studio/manager/concept-settings/main.html"
      dynamic:
        components:
          dynamicContentManager: "studio/manager/dynamic/components/dynamic-content-manager.html"
        main: "studio/manager/dynamic/main.html"
      landingPages:
        components:
          landingPageManager: "studio/manager/landing-pages/components/landing-page-manager.html"
          scLandingPage:      "studio/manager/landing-pages/components/sc-landing-page.html"
        main: "studio/manager/landing-pages/main.html"
    nav:
      layouts: "studio/nav/layouts.html"
      screens: "studio/nav/screens.html"
    screens:
      nav:  "studio/screens/nav.html"
    preloaders:
      circle: "studio/preloaders/circle.html"
      dots: "studio/preloaders/dots.html"
      bars: "studio/preloaders/bars.html"
  preview:
    demo:
      breadcrumbs:  "preview/demo/breadcrumbs.html"
      container:    "preview/demo/container.html"
      actions: "preview/demo/actions.html"
      wrapper: "preview/demo/wrapper.html"
      creativesNav: "preview/demo/creatives-nav.html"
    components:
      actions:        "preview/components/actions.html"
      adTagNav:       "preview/components/ad-tag-nav.html"
      containerNav:   "preview/components/container-nav.html"
      creativesNav:   "preview/components/creatives-nav.html"
    mobile:
      landingPageNav: "preview/mobile/landing-page-nav.html"
      actions:   "preview/mobile/actions.html"
      navigation:   "preview/mobile/navigation.html"
      siteHeader: "preview/mobile/site-header.html"
      components:
        mobileSettingsMenu: "preview/mobile/components/mobile-settings-menu.html"
        siteHeader: "preview/mobile/components/site-header.html"
        landingPageNav: "preview/mobile/components/landing-page-nav.html"
        sharedAdTagsPicker:  "preview/mobile/components/shared-adtags-picker.html"
        signalPicker:  "preview/mobile/components/signal-picker.html"
        navigation:  "preview/mobile/components/nav.html"
        actions:        "preview/mobile/components/actions.html"
    actions:        "preview/actions.html"
    navigation:        "preview/navigation.html"
    wrapper:        "preview/wrapper.html"
    partials:
      ad: "preview/_ad.html"
      adBackup: "preview/_ad-backup.html"
      adPublishInfo: "preview/_ad-publish-info.html"
      mobile:
        ad: "preview/_ad.html"
        adBackup: "preview/_ad-backup.html"
    deviceWrapper:        "preview/device-wrapper.html"
    deviceWrapperBackup:        "preview/device-wrapper-backup.html"
  workflow:
    main:     "workflow/main.html"
    header:     "workflow/header.html"
    breadcrumbs:     "workflow/_breadcrumbs.html"
    index:
      header: "workflow/index-header.html"
      body: "workflow/body.html"
    company:
      header: "workflow/company/header.html"
      body: "workflow/company/body.html"
      edit:
        body: "workflow/company/edit/body.html"
    campaigns:
      new:
        body: "workflow/campaigns/new/body.html"
    companies:
      new:
        body: "workflow/companies/new/body.html"
        header: "workflow/companies/new/header.html"
    campaign:
      header: "workflow/campaign/header.html"
      edit:
        body: "workflow/campaign/edit/body.html"
    components:
      avatarContainer: "workflow/components/avatar-container.html"
      creative:
        row: "workflow/components/creative/row.html"
      concept:
        actions: "workflow/components/concept/actions.html"
        featureRow: "workflow/components/concept/feature-row.html"
        featuresList: "workflow/components/concept/features-list.html"
        formatsList: "workflow/components/concept/formats-list.html"
        new: "workflow/components/concept/new.html"
        secondaryActions: "workflow/components/concept/secondary-actions.html"
        summaryRow: "workflow/components/concept/summary-row.html"
        thumbnail: "workflow/components/concept/thumbnail.html"
        schedulingAndTargeting: "workflow/components/concept/scheduling-and-targeting.html"
      conceptFormat:
        summaryRow: "workflow/components/conceptFormat/summary-row.html"
        companionRow: "workflow/components/conceptFormat/companion-row.html"
        companionsList: "workflow/components/conceptFormat/companions-list.html"
        creativesList: "workflow/components/conceptFormat/creatives-list.html"
        row: "workflow/components/conceptFormat/row.html"
      customSizes:        "workflow/components/custom-sizes.html"
      tagArrayValues: "workflow/components/tag-array-values.html"
      flight:
        secondaryActions: "workflow/components/flight/secondary-actions.html"
      customSizes:        "workflow/components/custom-sizes.html"
      tagArrayValues: "workflow/components/tag-array-values.html"
      campaignForm: "workflow/components/campaign-form.html"
      campaignGrid: "workflow/components/campaign-grid.html"
      campaignGrids:
        campaignBrand: "workflow/components/campaign-grid/campaign-brand.html"
        campaignNameFollowing: "workflow/components/campaign-grid/campaign-name-following.html"
        filters: "workflow/components/campaign-grid/filters.html"
        list: "workflow/components/campaign-grid/list.html"
        paging: "workflow/components/campaign-grid/paging.html"
      companyForm: "workflow/components/company-form.html"
      imageUpload: "workflow/components/image-upload.html"
    flights:
      body: "workflow/flights/body.html"
      components:
        flightCards:
          actions: "workflow/flights/components/flight-card/actions.html"
          quickActions: "workflow/flights/components/flight-card/quick-actions.html"
          new: "workflow/flights/components/flight-card/new.html"
          traffickingSheet: "workflow/flights/components/flight-card/trafficking-sheet.html"
          adTagRow: "workflow/flights/components/flight-card/ad-tag-row.html"
          adTagBulkActions: "workflow/flights/components/flight-card/ad-tag-bulk-actions.html"
        addStrategies: "workflow/flights/components/add-strategies.html"
        bulkFlightActions: "workflow/flights/components/bulk-flight-actions.html"
        adTagActionDropdownMenu: "workflow/flights/components/ad-tag-action-dropdown-menu.html"
        flightCard: "workflow/flights/components/flight-card.html"
        strategyCard: "workflow/flights/components/strategy-card.html"
        strategyActions: "workflow/flights/components/strategy-actions.html"
    strategies:
      body: "workflow/strategies/body.html"
      components:
        conceptRow: "workflow/strategies/components/concept-row.html"
        rulesAndScheduling:
          ruleRow: "workflow/strategies/components/rules-and-scheduling/rule-row.html"
          rules: "workflow/strategies/components/rules-and-scheduling/rules.html"
          schedulingRow: "workflow/strategies/components/rules-and-scheduling/scheduling-row.html"
          scheduling: "workflow/strategies/components/rules-and-scheduling/scheduling.html"
        strategyCard: "workflow/strategies/components/strategy-card.html"
        strategyCards:
          actions: "workflow/strategies/components/strategy-cards/actions.html"
          conceptAddRemoveStatus: "workflow/strategies/components/strategy-cards/concept-add-remove-status.html"
          navigation: "workflow/strategies/components/strategy-cards/navigation.html"
          manualWeighting: "workflow/strategies/components/strategy-cards/manual-weighting.html"
          new: "workflow/strategies/components/strategy-cards/new.html"
          rotationConceptsList: "workflow/strategies/components/strategy-cards/rotation-concepts-list.html"
          rulesAndScheduling: "workflow/strategies/components/strategy-cards/rules-and-scheduling.html"
          selectConcepts: "workflow/strategies/components/strategy-cards/select-concepts.html"
          rulesAndSchedulings:
            rotationTooltip: "workflow/strategies/components/strategy-cards/rules-and-scheduling/rotation-tooltip.html"
            conceptRow: "workflow/strategies/components/strategy-cards/rules-and-scheduling/concept-row.html"
            conceptActions: "workflow/strategies/components/strategy-cards/rules-and-scheduling/concept-actions.html"
    concepts:
      body: "workflow/concepts/body.html"
      row:                "workflow/concepts/row.html"
      components:
        conceptCard: "workflow/concepts/components/concept-card.html"
        conceptsList: "workflow/concepts/components/concepts-list.html"
        conceptCards:
          actions: "workflow/concepts/components/concept-cards/actions.html"
          formatSelector: "workflow/concepts/components/concept-cards/format-selector.html"
          new: "workflow/concepts/components/concept-cards/new.html"
          newCreative: "workflow/concepts/components/concept-cards/new-creative.html"
