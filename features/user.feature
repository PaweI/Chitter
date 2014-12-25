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

  Scenario: User Sign up with wrong data
    When User fill username already been taken
    Then User fill email already been taken
    Then User fill wrong password confirmation and click on Sign up
    And should see list of error messages

  Scenario: User can Log out
    When user logged in
    Then can log out
    And should see Good bye message

  Scenario: User can Log in
    When no user logged
    Then can enter loggin details 
    And should see Welcome message








