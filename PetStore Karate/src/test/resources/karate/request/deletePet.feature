Feature: Delete a pet
  As QA automation
  I want to delete a pet
  To validate the status code and response

  Background: consume service
    * url url

  Scenario: Delete a pet with a correct Id
    * def responsesDelete = read('classpath:karate/request/responseDelete.json')

    Given path 'pet', id
    When method delete
    Then status 200


  Scenario Outline: Delete a pet with a invalid Id

    * def idPet = <id>

    Given path 'pet', idPet
    When method Delete
    Then status <statusCode>
    And match response == <expected>

    Examples:
      | id     | statusCode | expected                                                                                              |
      | 701    | 404        | ''                                                                                                    |
      | 'gain' | 404        | {"code":404,"type":"unknown","message":"java.lang.NumberFormatException: For input string: \"gain\""} |
      | ''     | 405        | '<apiResponse><type>unknown</type></apiResponse>'                                                     |