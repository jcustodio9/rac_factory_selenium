require 'selenium-webdriver'
#require 'webdriver-user-agent'
require 'selenium/server'
require 'rubygems'

#define the browser object based on the command line input
case ENV['BROWSER']
	when "iphone","ipad","android_phone","android_tablet" then
		driver = Webdriver::UserAgent.driver(:browser => :chrome, :agent => :ENV['BROWSER'], :orientation => :portrait)
		#browser = Selenium::WebDriver.for driver
		browser.window.move_to(0, 0)

		if ENV['BROWSER'].match /iphone/i
			browser.window.resize_to 320, 568 #approximate iphone size
		elsif ENV['BROWSER'].match /ipad/i
			browser.window.resize_to 768, 1024 #approzimate ipad size
		elsif ENV['BROWSER'].match /android_tablet/i
			browser.window.resize_to 600, 960 #approximate nexus 7 size
		else
			browser.window.resize_to 360, 598 #approximate nexus 5 size
		end		

	when "firefox" then
		caps = Selenium::WebDriver::Remote::Capabilities.firefox
		caps.version = "30"
		caps.native_events = false
		caps.javascript_enabled= true

		# This is for increasing the default timeout to 180
		client = Selenium::WebDriver::Remote::Http::Default.new
		client.timeout = 300

		browser = Selenium::WebDriver.for :firefox
		browser.manage.window.maximize

	when "chrome" then
		caps = Selenium::WebDriver::Remote::Capabilities.chrome
		caps.version = "39.0.2171.71 m"
		caps.native_events = false
		caps.javascript_enabled= true

		# This is for increasing the default timeout to 180
		client = Selenium::WebDriver::Remote::Http::Default.new
		client.timeout = 180
		
		browser = Selenium::WebDriver.for :chrome
		browser.manage.window.maximize
end


#before each scenario set the browser object to the one defined
Before do
	@browser = browser
end

After do
	unless ENV["BROWSER"].eql? "ie"
		#browser.close
		sleep 2
	end
end
