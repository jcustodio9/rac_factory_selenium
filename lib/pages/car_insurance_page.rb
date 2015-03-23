class CarInsurancePage
	include PageObject

	# define the elements of the page
	span	 		:car_insurance_header, xpath: '//span[contains(text(), "Car insurance quote")]'


	def verify_car_insurance_page
		car_insurance_header_element.visible?
	end
end