class TravelInsurancePage
	include PageObject

	# define the elements of the page
	h1	 		:travel_insurance_header, xpath: '//h1[contains(text(), "Travel insurance")]'
	# elements for mobile interface
	select_list :travel_destination, xpath: '//select[@id="regionID"]'


	def verify_travel_insurance_page
		travel_insurance_header_element.visible?
	end

	def select_destination destination
		case ENV['BROWSER']
      		when "iphone","ipad","android_phone","android_tablet" then
				self.travel_destination = "#{destination}"
      		else
				@browser.switch_to.frame('quote-frame').find_element(travel_destination).select destination
      		end
      	sleep 1
    end  
	
end #TravelInsurancePage class