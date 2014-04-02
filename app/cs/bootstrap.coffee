require.config
  paths:
    vendors: 'vendors'

require ['main'], (Main)->
  $ ()->
    App = new Main()
    App.init()
  return
