When(/^I should see the Travel insurance page$/) do
  on TravelInsurancePage do |page| 
    page.verify_travel_insurance_page
  end 
end

When(/^I select Area of Travel: (.*?)$/) do |destination|
  on TravelInsurancePage do |page| 
    page.select_destination destination
  end 
end
