Feature: User Listing Api
  This api will give all the users api list

  Scenario: List users in JSON
    When I send and accept JSON
    And I have list of users:
    | id | name             | email                    |
    | 1  | Jayden Wunsch    | amie.gerhold@stamm.net   |
    | 2  | Bertha Hintz     | isom@jast.name           |
    | 3  | Johnnie Kreiger  | amira_oreilly@koepp.info |
    | 4  | Theron Schoen IV | ashley@koch.biz          |
    And I send a GET request to "/api/users"
    Then the response status should be "200"
    And the JSON response should be:
      """
      [{"id": 1, "name": "Jayden Wunsch", "email": "amie.gerhold@stamm.net"},
      {"id": 2, "name": "Bertha Hintz", "email": "isom@jast.name"},
      {"id": 3, "name": "Johnnie Kreiger", "email": "amira_oreilly@koepp.info"},
      {"id": 4, "name": "Theron Schoen IV", "email": "ashley@koch.biz"}]
      """