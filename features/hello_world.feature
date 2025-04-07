Feature: Hello World Example
  As a user
  I want to run a simple Hello World example
  So that I can verify my setup works

  Scenario: Running Hello World example
    Given I have a working environment
    When I execute the Hello World program
    Then I should see a "Hello, World" message in the output
