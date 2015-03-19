Feature: As a RAC website visitor
  I would like to navigate the website
  And visit all links
  And verify that all links are active

  
@navigation
Scenario: Verify nav menu in the home page
  Given I navigate to RAC home page
  Then I mouse over the navigation menu:        
    | menu              | submenu               |  link                         |           
    | motoring          | Roadside Assistance   |  Join Roadside Assistance     |
    | motoring          | Roadside Assistance   |  Pricing                      |
    | motoring          | Roadside Assistance   |  For business                 |
    | motoring          | Roadside Assistance   |  free2go for 17-19 year olds  |
    | motoring          | Roadside Assistance   |  Upgrade                      |
    | motoring          | Roadside Assistance   |  Gift card                    |
    | motoring          | Roadside Assistance   |  Change my address            |
    | motoring          | Roadside Assistance   |  Change vehicle details       |
