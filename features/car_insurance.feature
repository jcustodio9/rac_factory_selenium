Feature: As potential RAC customer I want to get a quote on car insurance
I want to check I can access and get a quote for a car insurance

@car_insurance_quote
Scenario: Get a quote for a car insurance
Given I navigate to RAC home page
When I click on the navigation link:
    | menu     		| submenu           | link 					|
    | insurance	 	| Car Insurance 	| Car insurance quote 	|
And I should see the Car insurance quote page
