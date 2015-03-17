Feature: As potential RAC customer I want to get a quote on travel insurance
I want to check I can access and get a quote for a travel insurance

@travel_insurance_quote @mobile
Scenario Outline: Get a quote for a travel insurance
Given I navigate to RAC home page
When I click on the navigation link:
    | menu     		| submenu           | link 					|
    | travel	 	| Travel insurance 	| Get a quote 			|
And I should see the Travel insurance page
And I select Area of Travel: <destination>


Examples:
| destination 	|
| Asia			|