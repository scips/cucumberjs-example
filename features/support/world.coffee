World = (callback)->
  @browser = require('wd').remote('http://localhost:4444/wd/hub')
  @browser.on 'status', console.log
  callback()
  
exports.World = World