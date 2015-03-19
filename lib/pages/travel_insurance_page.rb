class TravelInsurancePage
	include PageObject

	# define the elements of the page
	h1	 		:travel_insurance_header, xpath: '//h1[contains(text(), "Travel insurance")]'

	# elements for mobile interface
	select_list :travel_destination, xpath: '//select[@id="regionID"]'
	select_list :country, xpath: '//select[@id="destinationCountryID"]'
	button 		:next_button, xpath: '//input[@id="quoteSubmitBtn"]'
	link 		:departure_date_picker, xpath: '//input[@id="departureDate"]/following-sibling::a'
	link 		:return_date_picker, xpath: '//input[@id="returnDate"]/following-sibling::a'
	h4 			:calendar_label, xpath: '//div[contains(@class, "ui-datebox-container ui-overlay-shadow ui-corner-all pop ui-body-b in")]//div/div[contains(@class, "ui-datebox-gridlabel")]/h4'
	span 		:calendar_next, xpath: '//div[contains(@class, "ui-datebox-container ui-overlay-shadow ui-corner-all pop ui-body-b in")]//div[contains(@class, "gridplus")]//span[contains(@class, "ui-icon-plus")]'	
	text_field 	:traveler_1_age, xpath: '//input[@id="travelerAge_1"]'
	text_field 	:traveler_2_age, xpath: '//input[@id="travelerAge_2"]'
	select_list :accompanied_children, xpath: '//select[@id="totalChildren"]'
	text_field	:child_age, xpath: '//input[@id="travelerAge_3"]'
	select_list :is_rac_member, xpath: '//select[@id="isMember"]'
	span 		:pre_existing_yes, xpath: '//span[contains(@class, "slider")][contains(text(), "Yes")]'
	span 		:pre_existing_no, xpath: '//span[contains(@class, "slider")][contains(text(), "No")]'
	h1 			:your_quote_header_mobile, xpath: '//h1[contains(text(), "Your Quote")]'
	div 		:trip_info_pc, css: '#content > div > div > table > thead > tr > th'


	def verify_travel_insurance_page
		travel_insurance_header_element.visible?
	end


	def select_destination destination
		case ENV['BROWSER']
      		when "iphone","ipad","android_phone","android_tablet" then
				self.travel_destination = "#{destination}"
      		else
				@browser.switch_to.frame('quote-frame')
				travel_destination = Selenium::WebDriver::Support::Select.new(@browser.find_element(:xpath, '//select[@id="regionID"]'))
				travel_destination.select_by(:text, destination)
      		end
      	sleep 2
    end  
	

	def select_country country
		case ENV['BROWSER']
      		when "iphone","ipad","android_phone","android_tablet" then
				self.country = "#{country}"
				next_button
				sleep 3
      		else
      			country_destination = Selenium::WebDriver::Support::Select.new(@browser.find_element(:xpath, '//select[@id="destinationCountryID"]'))
				country_destination.select_by(:text, country)
				@browser.switch_to.default_content
				sleep 1
      		end
	end


	def pick_departure_date departure_date,departure_month,departure_year
		case ENV['BROWSER']
      		when "iphone","ipad","android_phone","android_tablet" then
				departure_date_picker
				until calendar_label_element.text.eql? departure_month + ' ' + departure_year
					calendar_next_element.click
				end
				@browser.find_elements(:xpath, '//div[contains(@class, "ui-datebox-container ui-overlay-shadow ui-corner-all pop ui-body-b in")]/div[@class="ui-datebox-grid"]/div[@class="ui-datebox-gridrow"]/div[contains(@class, "ui-datebox-griddate")]').each do |cell|
					if cell.text.eql? "#{departure_date}"
						highlight cell
						cell.click
						break
					end
				end
      		else
				@browser.switch_to.frame('quote-frame')
				@browser.find_element(:name, 'getQuote').location_once_scrolled_into_view
				@browser.find_element(:xpath, '//img[contains(@class, "ui-datepicker-trigger")]/preceding-sibling::input[@id="departureDate"]').click
				
				until ((@browser.find_element(:class, 'ui-datepicker-month').text.eql? "#{departure_month}".upcase) && (@browser.find_element(:class, 'ui-datepicker-year').text.eql? "#{departure_year}"))
					@browser.find_element(:xpath, '//a[contains(@class, "ui-datepicker-next ui-corner-all")]').click
				end

			 	@browser.find_elements(:xpath, '//table[contains(@class, "ui-datepicker-calendar")]/tbody/tr/td').each do |cell|
			 		if cell.text.eql? "#{departure_date}"
			 			cell.click
			 		end
			 	end
      		end
      	sleep 1
	end


	def pick_return_date return_date,return_month,return_year
		case ENV['BROWSER']
      		when "iphone","ipad","android_phone","android_tablet" then
				return_date_picker
				until calendar_label_element.text.eql? return_month + ' ' + return_year
					calendar_next_element.click
				end
				@browser.find_elements(:xpath, '//div[contains(@class, "ui-datebox-container ui-overlay-shadow ui-corner-all pop ui-body-b in")]/div[@class="ui-datebox-grid"]/div[@class="ui-datebox-gridrow"]/div[contains(@class, "ui-datebox-griddate")]').each do |cell|
					if cell.text.eql? "#{return_date}"
						highlight cell
						cell.click
						break
					end
				end
      		else
				@browser.find_element(:name, 'getQuote').location_once_scrolled_into_view
				@browser.find_element(:xpath, '//img[contains(@class, "ui-datepicker-trigger")]/preceding-sibling::input[@id="returnDate"]').click
				
				until ((@browser.find_element(:class, 'ui-datepicker-month').text.eql? "#{return_month}".upcase) && (@browser.find_element(:class, 'ui-datepicker-year').text.eql? "#{return_year}"))
					@browser.find_element(:xpath, '//a[contains(@class, "ui-datepicker-next ui-corner-all")]').click
				end

			 	@browser.find_elements(:xpath, '//table[contains(@class, "ui-datepicker-calendar")]/tbody/tr/td').each do |cell|
			 		if cell.text.eql? "#{return_date}"
			 			cell.click
			 		end
			 	end
      		end
      	sleep 3		
	end


	def enter_travellers_ages traveller_1,traveller_2
		unless traveller_1.eql? "NA"
			case ENV['BROWSER']
			when "iphone","ipad","android_phone","android_tablet" then
				next_button
				sleep 2
				traveler_1_age_element.send_keys traveller_1
			else
				@browser.find_element(:id, 'travelerAge_1').send_keys traveller_1
			end
		end

		unless traveller_2.eql? "NA"
			sleep 3
			case ENV['BROWSER']
			when "iphone","ipad","android_phone","android_tablet" then
				traveler_2_age_element.send_keys traveller_2
			else
				@browser.find_element(:id, 'travelerAge_2').send_keys traveller_2
			end
		end
		
	end

	
	def select_accompanied_children children,child_age
		unless ((children.eql? "NA") && (child_age.eql? "NA"))
			sleep 3
			case ENV['BROWSER']
			when "iphone","ipad","android_phone","android_tablet" then
				self.accompanied_children = "#{children}"
				child_age_element.send_keys child_age
			else
				accompanied_children = Selenium::WebDriver::Support::Select.new(@browser.find_element(:id, 'totalChildren'))
				accompanied_children.select_by(:text, children)
				@browser.find_element(:id, 'travelerAge_3').send_keys child_age
			end
		end
	end


	def is_resident resident
		unless resident.eql? "NA"
			sleep 3
			case ENV['BROWSER']
			when "firefox","ie","chrome" then
				if resident.eql? "Yes"
					@browser.find_element(:id, 'isResident_1').click
				else
					@browser.find_element(:id, 'isResident_2').click	
				end
			end
		end
	end


	def is_rac_member membership
		unless membership.eql? "NA"
			sleep 3
			case ENV['BROWSER']
			when "iphone","ipad","android_phone","android_tablet" then
				self.is_rac_member = "#{membership}"
			else
				rac_member = Selenium::WebDriver::Support::Select.new(@browser.find_element(:id, 'isMember'))
				rac_member.select_by(:text, membership)
			end
		end		
	end


	def is_pre_existing pre_existing
		unless pre_existing.eql? "NA"
			sleep 3
			case ENV['BROWSER']
			when "iphone","ipad","android_phone","android_tablet" then
				if pre_existing.eql? "Yes"
        			pre_existing_yes_element.click
      			else
      				#do nothing since default is 'No'
      		 	end
			end
		end			
	end


	def click_get_quote
		case ENV['BROWSER']
			when "iphone","ipad","android_phone","android_tablet" then
				next_button_element.focus()
				next_button
			else
				@browser.find_element(:name, 'getQuote').click
				@browser.switch_to.default_content
			end
		sleep 3	
	end


	def verify_quote_page
		case ENV['BROWSER']
			when "iphone","ipad","android_phone","android_tablet" then
				your_quote_header_mobile_element.exists?
				highlight @browser.find_element(:xpath, '//div[contains(@class, "selector quoteSelector")]')
			else
				trip_info_pc_element.exists?
				highlight @browser.find_element(:css, '#content > div > div > table > thead > tr > th')
			end
	end


	private 
  	#waits for the loading to disappear
  	def loading_wait
    	case ENV['BROWSER']
    	when "iphone","ipad","android_phone","android_tablet" then
      		wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    		wait.until {
        		not @browser.find_element(xpath: '//div[contains(@class, "load")]')
      		}
    	else
      		wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    		wait.until {
    			@browser.switch_to.frame('quote-frame')
        		not @browser.find_element(xpath: '//div[contains(@id, "load")]')
      		}
    	end
  	end


  	private
  	#highlights the element
  	def highlight element, time = 3
  		orig_style = element.attribute("style")
  		@browser.execute_script("arguments[0].setAttribute(arguments[1], arguments[2])", element, "style", "background-color: red;")
  		if time > 0
    		sleep time
    		@browser.execute_script("arguments[0].setAttribute(arguments[1], arguments[2])", element, "style", orig_style)
  		end
	end


end #TravelInsurancePage class