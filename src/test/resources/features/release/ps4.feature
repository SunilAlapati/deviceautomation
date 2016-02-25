@ps4 @disabled
Feature: PS4 Account Creation

  @ps4createAndLogin
  Scenario: Create a new user on PS4
    Given I start PS4 console
    When I goto PS4 Users page
    And I press PS4 New User button
    And I press PS4 Create a user button
    And I press PS4 Accept button
    And I press PS4 Next button
    And I press PS4 New to PlayStation Network? Create an Account button
    And I press PS4 Sign Up Now button
    And I enter PS4 United States on Country field
    And I enter PS4 English on Language field
    And I enter PS4 01/01/1990 on Date of Birth field
    And I press PS4 Next button
    And I enter PS4 92121 on Postal Code field
    And I move at bottom
    And I press PS4 Next button
    Given I have ps4SignInID as an unique string of length 20 with ps4 prefix @gmail.com postfix
    When I enter PS4 $ps4SignInID on Sign-In ID field
    And I enter PS4 somepassword3 on Password field
    And I press PS4 Next button
    Given I have ps4OnlineID as an unique string of length 15 with id prefix
    And I enter PS4 $ps4OnlineID on Online ID field
    And I enter PS4 Benedict on First Name field
    And I enter PS4 Cumberbatch on Last Name field
    And I press PS4 Next button
    And I press PS4 Confirm button
    And I press PS4 Confirm button
    And I press PS4 Confirm button
    And I press PS4 Accept button
    And I have a valid OAuth token with somepassword3 for $ps4SignInID
    And I create an email verification token with $ps4SignInID
    When I make a PUT request expecting status code 204 to email_verification:
      | type              | name      | value                   |
      | PATH_SUBSTITUTION | loginName | me                      |
      | JSON              | token     | $emailVerificationToken |
    Then It should return a successful result
    And I press PS4 Already Verified button
    And I press PS4 Do this later button
    And I press PS4 Next button
    And I press PS4 Skip button
    And I press PS4 Activate button

  @testGet3
  Scenario: get PS4 User
    When I have a valid OAuth token with sony13579 for abhirup.chatterjee+7@smss.sony.com
    And I make a GET request to accounts:
      | type              | name      | value |
      | PATH_SUBSTITUTION | loginName | me    |
    Then It should return a successful result
    And The response contains:
      | signinId         | abhirup.chatterjee+7@smss.sony.com |
      | addresses:0:city | San Diego                          |
      | realName:name:first                                        | abhirupe        |
      | realName:name:middle                                       | Chattg        |
      | realName:name:last                                         | chatterjeee          |
	  | addresses:0:city                                           | Los Angeles                  |
      | addresses:0:countrySubdivision                             | CA               |
      | addresses:0:postalCode                                     | 90028            |
	  | gender                                                     | m                |

  @VerifyEmail
  Scenario: Create a new user on PS4
    And I have a valid OAuth token with somepassword3 for ps4rZN7ZaC@gmail.com
    And I create an email verification token with ps4rZN7ZaC@gmail.com
    When I make a PUT request expecting status code 204 to email_verification:
      | type              | name      | value                   |
      | PATH_SUBSTITUTION | loginName | me                      |
      | JSON              | token     | $emailVerificationToken |
    Then It should return a successful result

  @VerifyEmail3
  Scenario: SMOKETEST I can create a valid NP account
    Given I have a new psn account
    And I get the tosua version for country US and locale en-US
    And I have an s2s OAuth token
    When I make a GET request to accounts:
      | type            | name     | value                              |
      | QUERY_PARAMETER | signinId | abhirup.chatterjee+7@smss.sony.com |
    Then It should return a successful result
    And The response contains:
      | signinId         | abhirup.chatterjee+7@smss.sony.com |
      | addresses:0:city | San Diego                          |

  
  Scenario: SMOKETEST I can create a valid NP account
    Given I have loginId as a new login name
    And I have an s2s OAuth token
    And I get the tosua version for country US and locale en-US
    When I make a POST request expecting status code 201 to create_account:
      | type   | name                     | value                 |
      | HEADER | X-ServiceEntity          | urn:service-entity:np |
      | JSON   | emailAddresses:0:address | $loginId              |
      | JSON   | password                 | sony1357              |
      | JSON   | pin                      | $EXCLUDE              |
      | JSON   | toSUAVersion             | $tosuaVersion         |
      | JSON   | gender                   | $EXCLUDE              |
      | JSON   | legalCountry             | US                    |
      | JSON   | language                 | en-US                 |
      | JSON   | dateOfBirth              | 1995-01-01            |
      | JSON   | securityResetVersion     | 1                     |
      | JSON   | signinId                 | $loginId              |
    Then It should return a successful result
    And The create response contains accountUuid as the new resource id
    And I have legacyAccountId as the accountId value from the result
    Given I have a valid OAuth token for $loginId
    When I make a GET request to account:
        | type              | name      | value |
        | PATH_SUBSTITUTION | loginName | me    |
        
        
        
        
        
        
     @createAcc   
        Scenario: SMOKETEST I can create a valid NP account
    Given I have loginId as a new login name
    And I have an s2s OAuth token
    And I get the tosua version for country US and locale en-US
    When I make a POST request expecting status code 201 to create_account:
      | type   | name                     | value                  |
      | HEADER | X-ServiceEntity          |urn:service-entity:np   |
      | JSON   | emailAddresses:0:address |$loginId  |
      | JSON   | password                 |sony1357|
      | JSON   | pin                      | $EXCLUDE           |
      | JSON   | toSUAVersion             | $tosuaVersion      |
      | JSON   | gender                   | $EXCLUDE           |
      | JSON   | legalCountry             | US                 |
      | JSON   | language                 | en-US              |
      | JSON   | dateOfBirth              | 1995-01-01         |
      | JSON   | securityResetVersion     | 1 |
      | JSON   | signinId                 | $loginId             |
    Then It should return a successful result
    Given I have a valid OAuth token for $loginId
    When I make a GET request to account:
        | type              | name      | value |
        | PATH_SUBSTITUTION | loginName | me    |
Then It should return a successful result

@testCD
Scenario: I create a valid account and do email verification
Given I have a new psn account
    And I have a valid OAuth token with sony1357 for $loginId 
    And I create an email verification token with $loginId
    When I make a PUT request expecting status code 204 to email_verification: 
        | type              | name      | value                     |
        | PATH_SUBSTITUTION | loginName | me                        |
        | JSON              | token     | $emailVerificationToken   |
    Then It should return a successful result 




    

        