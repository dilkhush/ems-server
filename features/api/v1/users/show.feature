Feature: User Show Api

  Scenario: User detail in JSON
    When I send and accept JSON
    And I have list of users:
    | id | name             | email                    |
    | 1  | Jayden Wunsch    | amie.gerhold@stamm.net   |
    | 2  | Bertha Hintz     | isom@jast.name           |
    | 3  | Johnnie Kreiger  | amira_oreilly@koepp.info |
    | 4  | Theron Schoen IV | ashley@koch.biz          |
    And I send a GET request to "/api/users/1"
    Then the response status should be "200"
    And the JSON response should be:
      """
      {"id": 1, "name": "Jayden Wunsch", "email": "amie.gerhold@stamm.net"}
      """

  Scenario: User not found
    When I send and accept JSON
    And I have list of users:
    | id | name             | email                    |
    | 1  | Jayden Wunsch    | amie.gerhold@stamm.net   |
    | 2  | Bertha Hintz     | isom@jast.name           |
    | 3  | Johnnie Kreiger  | amira_oreilly@koepp.info |
    | 4  | Theron Schoen IV | ashley@koch.biz          |
    And I send a GET request to "/api/users/10"
    Then the response status should be "404"
    And the JSON response should be:
      """
      {"errors": "User not found"}
      """
