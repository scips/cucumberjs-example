define ['jquery'],($)->
  class Main
    constructor: ()->

    init: () ->
      $('.js-screen').hide()
      $('#loading').show()

  App = new Main()
  App.init()
  