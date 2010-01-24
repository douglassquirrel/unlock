Feature: Show Donate button
  In order to make sure everyone can donate to the Labour party using BlindPages
  I want to check you can navigate to the Help page and see a Donate button with correct alt text

  Scenario: Donating
    Given I have opened "http://blindpages.com/labour"
    When I click the "How you can help" link
    Then the page should contain a button with alt text "DONATE"
