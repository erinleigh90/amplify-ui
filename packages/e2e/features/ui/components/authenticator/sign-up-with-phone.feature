Feature: Sign Up with Phone 

  Create a new user in the Amazon Cognito UserPool by passing the new user’s phone number and password.

  Background:
    Given I'm using the example "ui/components/authenticator/sign-up-with-phone/"
    And I click "Create account"


  @next @react @vue @angular
  Scenario: Login mechanism set to "phone_number"
    Then I see "Phone Number" as an input field
    And I don't see "Username" as an input field
    And I don't see "Email" as an input field

  @next @react @vue @skip
  Scenario: Sign up with valid phone number & password
    When I select the country code "+1"
    And I type the phone number "VALID_PHONE_NUMBER"
    And I type the password "VALID_PASSWORD"
    And I confirm the password "VALID_PASSWORD"
    And I click the "Create Account" button
    Then I see "Confirmation Code"

  @next @react @vue @angular
  Scenario: Phone number field autocompletes username

  On sign up form, autocomplete prefers usage of username instead of phone number. 
  See https://www.chromium.org/developers/design-documents/form-styles-that-chromium-understands.

    And "Phone Number" field autocompletes "username"

  @next @react @vue @angular
  Scenario: Password fields autocomplete "new-password"
    And "Password" field autocompletes "new-password"
    And "Confirm Password" field autocompletes "new-password"
    