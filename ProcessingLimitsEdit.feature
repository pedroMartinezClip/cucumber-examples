@customer360 @web
Feature: As I admin user I want to be able to modify the limit of transactions.

  Scenario: Modify and save the limits of a transaction.
    Given I am an admin that logs in to customer360 page
    When I navigate to the details of an active transaction
    And modify EMV with a ticket number 93470, a comment "Test" and limits as:
      | Per Transaction               | 25,000 |
      | Daily number of transactions  | 25,002 |
      | TPV                           | 50,004 |
      | Hourly number of transactions | 50,003 |
      | TPV(2)                        | 50,004 |
    And confirm the changes
    Then a confirmation message will be displayed
    And EMV Limits should update as:
      | Per Transaction               | 25,000 |
      | Daily number of transactions  | 25,002 |
      | TPV                           | 25,004 |
      | Hourly number of transactions | 25,003 |
      | TPV(2)                        | 25,004 |

  Scenario: Validate error notification message is displayed when the user does not change any limit.
    Given I am an admin that logs in to customer360 page
    When I navigate to the details of an active transaction
    And modify EMV with a ticket number 93470, a comment "Test" without modifying the limits
    And confirm the changes
    Then an error message will be displayed
