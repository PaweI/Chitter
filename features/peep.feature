Feature: User can post a peep
  Peep will have name and handle of it's creator
  User can only peep when logged in
  Peeps displayed in chronological order
  User can see peeps even when logged out

  Scenario: Post a peep
    When open main page 
    And fill peep box and click PEEP
    Then should see peep on a page

  Scenario: User can not Peep when logged out
    When open main page
    And click peep
    Then should see error