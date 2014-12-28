Feature: User can post a peep
  Peep will have name and handle of it's creator
  User can only peep when logged in
  User can see peeps even when logged out
  Peeps displayed in chronological order

  Scenario: Post a peep
    When open main page 
    And fill peep box and click PEEP
    Then should see peep on a page

  Scenario: User can not Peep when logged out
    When open main page
    And click peep
    Then should see error

  Scenario: User can see Peeps when not logged in
    When open main page
    Then should see a peep

  Scenario: Peeps dislpayed in chronological order
    When open main page
    And create 3 peeps 
    Then should see LAST peep first and so on up to the first one

  Scenario: User can see time when peep was submitted
    When open main page
    Then should see time when peep was created

  Scenario: Name and handle of creator in Peep
    When open main page
    Then should see Peep with name and handler of it's creator


