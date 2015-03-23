class CarInsurancePage
	include PageObject

	# define the elements of the page
	span	 		:car_insurance_header, xpath: '//span[contains(text(), "Car insurance quote")]'
	text_field		:registration_number, xpath: '//input[@id="Question_Vehicle_Vehicle_RegistrationNumber"]'
	link 			:find_car_registration, xpath: '//a[contains(@class, "find-button")]'

	def verify_car_insurance_page
		car_insurance_header_element.visible?
	end

	def find_registration_number reg_number
		registration_number_element.send_keys reg_number
		find_car_registration
		sleep 2
	end

	
end