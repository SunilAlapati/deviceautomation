Feature: PS4 Account Creation

  @regression
  Scenario: Create a new user on PS4
    Given I start PS4 console
    When I goto PS4 Users page
    And I press PS4 New User button
  

  @release
  Scenario: get PS4 User
    When I have a valid OAuth token with sony13579 for abhirup.chatterjee+7@smss.sony.com
    And I make a GET request to accounts:
      | type              | name      | value |
      | PATH_SUBSTITUTION | loginName | me    |
    Then It should return a successful result
    
  @hotfix
  Scenario: Create a new user on PS4
    And I have a valid OAuth token with somepassword3 for ps4rZN7ZaC@gmail.com
    And I create an email verification token with ps4rZN7ZaC@gmail.com
    When I make a PUT request expecting status code 204 to email_verification:
      | type              | name      | value                   |
      | PATH_SUBSTITUTION | loginName | me                      |
      | JSON              | token     | $emailVerificationToken |
    Then It should return a successful result

  