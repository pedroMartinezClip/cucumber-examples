@customer360 @web
Feature: As I admin user I want to be able to modify the limit of transactions.

  Scenario: Modify and save the limits of a transaction.
    Given I am an admin that logs in to customer360 page
    When I navigate to the details of an active transaction
    And modify EMV with a ticket number 93470, a comment "Test" and limits as:
      | Per Transaction               | 10,000 |
      | Daily number of transactions  | 10,002 |
      | TPV                           | 10,004 |
      | Hourly number of transactions | 10,003 |
      | TPV(2)                        | 10,004 |
    And confirm the changes
    Then a confirmation message will be displayed
    And EMV Limits should update as:
      | Per Transaction               | 10,000 |
      | Daily number of transactions  | 10,002 |
      | TPV                           | 10,004 |
      | Hourly number of transactions | 10,003 |
      | TPV(2)                        | 10,004 |

  Scenario: Validate error notification message is displayed when the user does not change any limit.
    Given I am an admin that logs in to customer360 page
    When I navigate to the details of an active transaction
    And modify EMV with a ticket number 93470, a comment "Test" without modifying the limits
    And confirm the changes
    Then an error message will be displayed


  Scenario: Validate error notification message is displayed when the user does not change any limit.
    Given I am an admin that logs in to customer360 page
    When I navigate to the details of an active transaction
    And modify EMV with a ticket number 93470
    But no comment is added
    Then button confirm should be gray out