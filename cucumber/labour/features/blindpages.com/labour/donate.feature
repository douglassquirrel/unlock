Feature: Show Donate button
  In order to make sure everyone can donate to the Labour party using BlindPages
  I want to check you can navigate to the Help page and see a Donate button with correct alt text

  Scenario: Donating
    When I go to http://blindpages.com/labour
    When I follow "How you can help" 
    Then the page should contain a button with alt text "DONATE"
