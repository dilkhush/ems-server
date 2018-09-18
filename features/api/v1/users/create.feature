Feature: Create User Api

  Scenario: Create User API
    When I send and accept JSON
    And I have list of users:
    | id | name             | email                    |
    | 1  | Jayden Wunsch    | amie.gerhold@stamm.net   |
    | 2  | Bertha Hintz     | isom@jast.name           |
    | 3  | Johnnie Kreiger  | amira_oreilly@koepp.info |
    | 4  | Theron Schoen IV | ashley@koch.biz          |
    And I send a POST request to "/api/users" with the following:
    """
    {"user": {"name": "Cordell Baumbach", "email": "bill_hermiston@haley.info"}}
    """
    Then the response status should be "201"

  Scenario: Create User Validation Error
    When I send and accept JSON
    And I have list of users:
    | id | name             | email                    |
    | 1  | Jayden Wunsch    | amie.gerhold@stamm.net   |
    | 2  | Bertha Hintz     | isom@jast.name           |
    | 3  | Johnnie Kreiger  | amira_oreilly@koepp.info |
    | 4  | Theron Schoen IV | ashley@koch.biz          |
    And I send a POST request to "/api/users" with the following:
    """
    {"user": {"name": "", "email": ""}}
    """
    Then the response status should be "422"
    And the JSON response should be:
    """
    {"errors": ["Name can't be blank", "Email can't be blank"]}
    """

