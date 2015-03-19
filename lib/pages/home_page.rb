class HomePage
	include PageObject

	page_url("#{ENV['URL']}")

	#opens the url defined in ENV['URL']
	def goto_homepage
  		visit(HomePage)
  		loading_wait
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
end