define [],()->
  class Main
    constructor: ()->
      @currentController = $('#loading')
      @currentHandler = @loadingHandler

    init: () ->
      $('.js-screen').hide()
      @currentController.show()
      @bind()
      @timeOut()

    timeOut: () ->
      setTimeout ()->
        eventData=
          name: 'loading done'
        e = $.Event('appEvent',eventData)
        $('body').trigger(e)
      , Math.floor(10000*Math.random()+1000)

    eventHandler: (e)=>
      @currentHandler(e)

    bind: () ->
      $('body').bind 'appEvent', @eventHandler
      $('body').bind 'keydown', @eventHandler

    ctrl1Handler: (e)->
      if e.type is 'keydown' and e.key is 'Right'
        @switchController 'ctrl2'

    ctrl2Handler: (e)->
      if e.type is 'keydown' and e.key is 'Left'
        @switchController 'ctrl1'

    loadingHandler: (e)->
      if e.type is 'appEvent' and e.name is 'loading done'
        @switchController 'ctrl1'

    switchController: (name)->
      @previousController = @currentController
      switch name
        when 'ctrl1'
          @currentController = $('#screen1')
          @currentHandler = @ctrl1Handler
        when 'ctrl2'
          @currentController = $('#screen2')
          @currentHandler = @ctrl2Handler
      @previousController.slideUp 1000, ()=>
        @currentController.slideDown(1000)