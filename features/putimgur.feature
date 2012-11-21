Feature: Posting to Imgur.com 

  Scenario: Posting a valid image to imgur
    When I specify a macho man image
    Then it should post to imgur 
    And return the imgur url 
