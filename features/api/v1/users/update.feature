Feature: Update User Api

  Scenario: Update User
    When I send and accept JSON
    And I have list of users:
    | id | name             | email                    |
    | 1  | Jayden Wunsch    | amie.gerhold@stamm.net   |
    | 2  | Bertha Hintz     | isom@jast.name           |
    | 3  | Johnnie Kreiger  | amira_oreilly@koepp.info |
    | 4  | Theron Schoen IV | ashley@koch.biz          |
    And I send a PUT request to "/api/users/1" with the following:
    """
    {"user": {"name": "Cordell Baumbach", "email": "bill_hermiston@haley.info"}}
    """
    Then the response status should be "200"

  Scenario: Update User Validation Error
    When I send and accept JSON
    And I have list of users:
    | id | name             | email                    |
    | 1  | Jayden Wunsch    | amie.gerhold@stamm.net   |
    | 2  | Bertha Hintz     | isom@jast.name           |
    | 3  | Johnnie Kreiger  | amira_oreilly@koepp.info |
    | 4  | Theron Schoen IV | ashley@koch.biz          |
    And I send a PUT request to "/api/users/1" with the following:
    """
    {"user": {"name": "", "email": ""}}
    """
    Then the response status should be "422"
    And the JSON response should be:
    """
    {"errors": ["Name can't be blank", "Email can't be blank"]}
    """

  Scenario: User not found
    When I send and accept JSON
    And I have list of users:
    | id | name             | email                    |
    | 1  | Jayden Wunsch    | amie.gerhold@stamm.net   |
    | 2  | Bertha Hintz     | isom@jast.name           |
    | 3  | Johnnie Kreiger  | amira_oreilly@koepp.info |
    | 4  | Theron Schoen IV | ashley@koch.biz          |
    And I send a PUT request to "/api/users/10"
    Then the response status should be "404"
    And the JSON response should be:
      """
      {"errors": "User not found"}
      """

