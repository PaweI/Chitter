Feature: User can use Chitter
  Should display Sign up 
  Should display Log in
  Should display Log out

  Scenario: Sign up
    When opening main page
    And user not logged in
    Then user should see link Sign up

  Scenario: User can Sign up 
    When open home page and click on Sign up
    And user should see the following form:
    | Enter your name          |
    | Enter your username      |
    | Enter your email         |
    | Enter your password      |
    | Type your password again |
    Then fill that form and click Sign up
    And User should see homepage with welcome message





