Feature: Create new user into losestudiantes
    As an user I want to create an account  into losestudiantes website in order to rate teachers

Scenario Outline: Create account failed with fullname and degree empty

  Given I go to losestudiantes home screen
    When I open the login screen
    And Fill with <firstname>, <lastname>, <email>, <password> and <degree>
    And I try to create an account <agreeTerms>
    Then The css <controlError> has to be red

    Examples:
      | firstname  | lastname       | email                           | password  | degree | agreeTerms | controlError   |
      |            | Castellanos    |pa.castellanos23@uniandes.edu.co | test1234  | 12     | true       |  name          |
      | Paula      |                |pa.castellanos23@uniandes.edu.co | test1234  | 12     | true       |  lastname      |
      | Paula      | Castellanos    |pa.castellanos23@uniandes.edu.co | test1234  |inicial | true       |  degree        |

      
Scenario Outline: Create account with information of existing user

  Given I go to losestudiantes home screen
    When I open the login screen
    And Fill with <firstname>, <lastname>, <email>, <password> and <degree>
    And I try to create an account <agreeTerms>
    Then I will see the alert <message>

    Examples:
      | firstname  | lastname       | email                           | password  | degree  | agreeTerms | message              |
      | Paula      | Castellanos    |pa.castellanos22@uniandes.edu.co | test1234  | 12      | true       | Error: Ya existe un usuario registrado con el correo 'pa.castellanos22@uniandes.edu.co' |



Scenario Outline: Create account failed with wrong inputs

  Given I go to losestudiantes home screen
    When I open the login screen
    And Fill with <firstname>, <lastname>, <email>, <password> and <degree>
    And I try to create an account <agreeTerms>
    Then I will see validate <message>

    Examples:
      | firstname  | lastname       | email                           | password  | degree | agreeTerms | message                                           |
      | Paula      | Castellanos    |                                 | test1234  | 12     | true       | Ingresa tu correo                                 |
      | Paula      | Castellanos    |            a                    | test1234  | 12     | true       | Ingresa un correo valido                          |
      | Paula      | Castellanos    | pa.castellanos22@uniandes.edu.co|           | 12     | true       | Ingresa una contraseña                            |
      | Paula      | Castellanos    | pa.castellanos22@uniandes.edu.co|     12    | 12     | true       | La contraseña debe ser al menos de 8 caracteres   |
      | Paula      | Castellanos    |pa.castellanos23@uniandes.edu.co | test1234  | 12     | false      | Debes aceptar los términos y condiciones          |
