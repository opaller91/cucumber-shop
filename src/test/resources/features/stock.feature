Feature: Check Stock
  As a manager
  I want to check stock

  Background:
    Given the store is ready to service customers
    And a product "Bread" with price 20.50 and stock of 5 exists
    And a product "Jam" with price 80.00 and stock of 10 exists
    And a product "Milk" with price 99.00 and stock of 15 exists

  Scenario: Buy one product
    When I buy "Bread" with quantity 2
    Then "Bread" in stock should be 3

  Scenario: Buy multiple products
    When I buy "Bread" with quantity 2
    And I buy "Jam" with quantity 1
    Then "Bread" in stock should be 3
    Then "Jam" in stock should be 9

  Scenario Outline: Buy one product in table
    When I buy <product> with quantity <quantity>
    Then <product> in stock should be <stock>
    Examples:
      | product  | quantity |  stock  |
      | "Bread"  |     1    |    4    |
      | "Jam"    |     2    |    8    |
      | "Milk"   |     3    |    12   |