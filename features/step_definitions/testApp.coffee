stepDefinitionScreen1 = ()->
  @World = require('../support/world').World

  @Given /^I am launching the application$/, (callback) ->
    # express the regexp above with the code you wish you had
    @browser.init ()=>
      @browser.get 'http://127.0.0.1:9001/', callback

  @Then /^I should see "([^"]*)" after maximum "([^"]*)" seconds$/,
    (selector, timeout, callback) ->
      @browser.waitForConditionInBrowser(
        "document.querySelector('#{selector}').style.display == 'block'",
        timeout*1000, 250, (err, el)->
          if err
            callback.fail()
          else
            callback()
        )

  @Given /^I am on "([^"]*)"$/, (selector, callback) ->
    timeout = 5
    console.log "testing selector (#{selector}):"
    @browser.elementByCss "#{selector}", (err, el)->
      if err
        console.log "async"
        callback.fail()
      else
        console.log "no error"
        if el.style.display == 'block'
          callback()
        else
          callback.fail()
    @browser.quit()
    @browser.waitForConditionInBrowser(
      "document.querySelector('#{selector}').style.display == 'block'",
      timeout*1000, 250, (err, el)->
        if err
          callback.fail()
        else
          callback()
      )

  @When /^I press "([^"]*)"$/, (key, callback) ->
    switch key
      when 'left'
        @browser.elementByCss('body').sendKeys(@wd.SPECIAL_KEYS['Right arrow'])
        callback()
      when 'right'
        @browser.elementByCss('body').sendKeys(@wd.SPECIAL_KEYS['Right arrow'])
        callback()
      else
        callback.fail()


module.exports = stepDefinitionScreen1