When(/^I should see the Car insurance quote page$/) do
  on CarInsurancePage do |page| 
    page.verify_car_insurance_page
  end 
end