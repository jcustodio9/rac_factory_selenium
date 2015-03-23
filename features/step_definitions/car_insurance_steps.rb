When(/^I should see the Car insurance quote page$/) do
  on CarInsurancePage do |page| 
    page.verify_car_insurance_page
  end 
end

When(/^I should find the car registration number:(.*?)$/) do |reg_number|
  on CarInsurancePage do |page| 
    page.find_registration_number reg_number
  end 
end