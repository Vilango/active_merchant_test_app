Feature: User
  In order to pay for the service
  user
  wants to pay with credit card

  @javascript
  Scenario: pay with austrian account
     Given I am at directebanking page
     And I press "Make Payment"
     And I follow "English"
     And I should see "secure payment form"
     And I select "Austria" from "Country"
     And I fill in "00000" for "Sort code"
     And I press "WizardSubmitButton"
     And I should see "Bank Login"
     And I fill in "12345" for "BackendFormLOGINNAMEUSERID"
     And I fill in "12345" for "BackendFormUSERPIN"
     And I press "WizardSubmitButton"
     And I should see "Please select a bank account"
     And I choose "TransactionsSessionSenderAccountNumberNormalized_23456789"
     And I press "WizardSubmitButton"
     And I should see "Please enter your TAN"
     And I fill in "12345" for "BackendFormTan"
     And I press "WizardSubmitButton"
     Then show me the page
     And I should see "success"

  # Scenario: Pay with visa - bad cvc code 
  #   Given I am at payment page
  #   When I use credit card "visa", "4111111111111111", "TestCustomer", "12",  "2012", "738"
  #   Then I should see "REFUSED"
    