Feature: basic test

  Background:
    As a Good developer
    I want to test my sites
    So that guarantee they work

  Scenario: Testing Hello World
    Given I browse "http://web"
    Given I am on homepage
    And I should see "Hello"

