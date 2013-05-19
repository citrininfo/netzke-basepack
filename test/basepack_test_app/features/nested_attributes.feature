Feature: Nested attributes
  In order to value
  As a role
  I want feature

@javascript
Scenario: Grid with nested attributes
  Given an author exists with first_name: "Vlad", last_name: "Nabokoff"
  And a book exists with title: "Lola", author: that author
  When I go to the BookGridWithNestedAttributes test page
  Then I should see "Vlad" within "#book_grid_with_nested_attributes"
  And I should see "Nabokoff" within "#book_grid_with_nested_attributes"

  When I select first row in the grid
  And I click "Edit in form"
  And I fill in "Author first name:" with "Vladimir"
  And I fill in "Author last name:" with "Nabokov"
  And I fill in "Title:" with "Lolita"
  And I click "OK"

  Then I should see "Nabokov"
  Then an author should exist with first_name: "Vladimir", last_name: "Nabokov"
  And a book should exist with title: "Lolita", author: that author

  But an author should not exist with first_name: "Vlad"
  And a book should not exist with title: "Lola"
