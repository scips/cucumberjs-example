Feature: Cucumber JS 
  As a developper
  I want to know how to test a coffee script require js app
  With cucumber

  Scenario: As a user I want to see Screen1
    Given I am launching the application
    Then I should see "#screen1" after maximum "15" seconds

  Scenario: As a user I want to see Screen2
    Given I am on "#screen1"
    When I press "right"
    Then I should see "#screen2" after maximum "4" seconds

  Scenario: As a user I want to see Screen1 after Screen2
    Given I am on "#screen2"
    When I press "left"
    Then I should see "#screen1" after maximum "4" seconds