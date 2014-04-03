stepDefinitionScreen1 = ()->
  @World = require('../support/world').World

  @Given /^I am launching the application$/, (callback) ->
    # express the regexp above with the code you wish you had
    @browser.init ()=>
      @browser.get 'http://127.0.0.1:9001/', callback

  @Then /^I should see "([^"]*)" after maximum "([^"]*)" seconds$/,
    (selector, timeout, callback) ->
      @browser.waitForConditionInBrowser(
        "document.querySelector('#screen1').style.display == 'block'",
        timeout*1000, 250, (err, el)=>
          if err
            console.log err
            callback.fail()
          else
            @browser.quit()
            callback()
        )

module.exports = stepDefinitionScreen1