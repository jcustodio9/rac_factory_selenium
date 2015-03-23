class Navigation
	include PageObject

  	#xpath for the pc version of menu, submenu, and link
  	@@nav_1 = '//ul[@class="megaNav"]//a[contains(@id, "%{menu}")]'

    @@nav_2 = '//ul[@class="megaNav"]//div[contains(@id, "%{menu}")]/div[contains(@class, "navigationColumn1")]/ul/li'
 	@@nav_2a = @@nav_2 + '/h4/a[contains(text(), "%{submenu}")]'
    @@nav_2b = @@nav_2 + '/h4[contains(text(), "%{submenu}")]'
    @@nav_2c = @@nav_2 + '/a/h4[contains(text(), "%{submenu}")]'
    @@nav_3 = '//ul[@class="megaNav"]//div[contains(@id, "%{menu}")]/div[contains(@class, "navigationColumn1")]/ul/li/a[contains(text(), "%{link}")]'
	
    # Mobile navigation menu
    @@mobile_logo = '//a[@class="logo"]'
    @@mobile_nav_menu_container = '//div[contains(@class, "af_panelGroupLayout")]'

    #To use when menu has 1-3 levels
    @@mobile_level_1_expand = '//ul[@class="subMenu"]//a[contains(text(), "%{menu}")]/span'
    @@mobile_level_2_expand = @@mobile_nav_menu_container + '//div[contains(@class, "accordion")]/header[contains(text(), "%{submenu}")]/span'
    
    @@mobile_level_1_link = @@mobile_nav_menu_container + '//div/section/a[contains(text(), "%{link}")]'
    @@mobile_level_2_link = @@mobile_nav_menu_container + '//div[contains(@class, "accordion")]/header[contains(text(), "%{submenu}")]'
    
    #Additional to use when menu has 4 levels
    @@mobile_level_1_addtl_expand = @@mobile_nav_menu_container + '//ul[contains(@class, "subMenu")]//a[contains(text(), "%{submenu}")]/span'
    @@mobile_level_2_addtl_expand = @@mobile_nav_menu_container + '//ul[contains(@class, "subMenu")]//a[contains(text(), "%{link}")]/span'
    @@mobile_level_3_expand = @@mobile_nav_menu_container + '//div[contains(@class, "accordion")]/header[contains(text(), "%{link}")]/span'  
    @@mobile_level_3_link = @@mobile_nav_menu_container + '//div[contains(@class, "accordion")]/header[contains(text(), "%{link}")]/following-sibling::section/a[contains(text(), "%{sublink}")]'


    #function to check if all the links are present on navigation bar
    def check_navigation_links table
        menus = table.hashes
        menus.each do |menu_item| 
        case ENV['BROWSER']
            when "iphone","ipad","android_phone","android_tablet" then
                # Level 1
                location = @@mobile_level_1_expand % Hash[menu_item.map{|(k,v)| [k.to_sym(&:downcase),v]}]
                expand_mobile_nav_menu_line location
                
                # Level 2
                location = @@mobile_level_1_addtl_expand % Hash[menu_item.map{|(k,v)| [k.to_sym(&:downcase),v]}]
                unless "#{menu_item[:submenu]}".eql? ""
                    expand_mobile_nav_menu_line location
                end
                
                # Level 3: NEED TO EDIT!!!
                location = @@mobile_level_2_addtl_expand  % Hash[menu_item.map{|(k,v)| [k.to_sym(&:downcase),!v.empty?]}]
                unless "#{menu_item[:link]}".eql? ""
                    expand_mobile_nav_menu_line location
                end

                @browser.find_element(:xpath, @@mobile_logo).click

            else   
                # Level 1
                sleep 0.3
                location = @@nav_1 % Hash[menu_item.map{|(k,v)| [k.to_sym(&:downcase),v]}]
                @browser.mouse.move_to @browser.find_element(xpath: location)
                
                # Level 2
                sleep 0.4
                location1 = @@nav_2a % Hash[menu_item.map{|(k,v)| [k.to_sym(&:downcase),v]}]
                location2 = @@nav_2b % Hash[menu_item.map{|(k,v)| [k.to_sym(&:downcase),v]}]
                location3 = @@nav_2c % Hash[menu_item.map{|(k,v)| [k.to_sym(&:downcase),v]}]

                case location
                when location = location1 then
                    @browser.mouse.move_to @browser.find_element(:xpath, location1)
                when location = location2 then
                    @browser.mouse.move_to @browser.find_element(:xpath, location2)
                when location = location3 then
                    @browser.mouse.move_to @browser.find_element(:xpath, location3)
                end

                # Level 3
                sleep 0.3
                location = @@nav_3 % Hash[menu_item.map{|(k,v)| [k.to_sym(&:downcase),v]}]
                if @browser.find_element(:xpath, location).displayed?
                    @browser.mouse.move_to @browser.find_element(:xpath, location)
                else 
                    puts "Link not found : #{menu_item[:link]}"
                end
                sleep 0.3
            end 
        end 
    end # check_nav_links


  	#clicks on the navigation - level 1
  	def click_on_navigation_level_1 table
    	menus = table.hashes
    	menus.each do |menu_item|    
      	# Level 1
      	location = @@nav_1 % Hash[menu_item.map{|(k,v)| [k.to_sym(&:downcase),v]}]
      	@browser.find_element(xpath: location).click
    	end
  	end # click_on_navigation_level_1


  	#clicks on the navigation - level 2
  	def click_on_navigation_level_2 table
    	menus = table.hashes
    	menus.each do |menu_item|   
      	case ENV['BROWSER']
            when "iphone","ipad","android_phone","android_tablet" then
        	   #Expand Level 1
        	   sleep 1
        	   location = @@mobile_level_1_expand % Hash[menu_item.map{|(k,v)| [k.to_sym(&:downcase),v]}]
        	   expand_mobile_nav_menu_line location
        	   #Click on the link
        	   sleep 1
        	   location = @@mobile_level_2_link % Hash[menu_item.map{|(k,v)| [k.to_sym(&:downcase),v]}]
        	   click_mobile_nav_link location
            else
        	   # Level 1
        	   location = @@nav_1 % Hash[menu_item.map{|(k,v)| [k.to_sym(&:downcase),v]}]
        	   @browser.mouse.move_to @browser.find_element(xpath: location)
        	   # Level 2
        	   location = @@nav_2 % Hash[menu_item.map{|(k,v)| [k.to_sym(&:downcase),v]}]
        	   @browser.find_element(xpath: location).click
            end
    	end      
  	end # click_on_navigation_level_2


  	#clicks on the link - level 3
  	def click_on_navigation_level_3 table
    	menus = table.hashes
    	menus.each do |menu_item| 
      	# Level 1
      	case ENV['BROWSER']
            when "iphone","ipad","android_phone","android_tablet" then
                #Expand Level 1
                sleep 1
                location = @@mobile_level_1_expand % Hash[menu_item.map{|(k,v)| [k.to_sym(&:downcase),v]}]
                expand_mobile_nav_menu_line location
                #Expand Level 2
                sleep 1
                location = @@mobile_level_2_expand % Hash[menu_item.map{|(k,v)| [k.to_sym(&:downcase),v]}]
                expand_mobile_nav_menu_line location
                sleep 1
       	 	    #Click on the link
                location = @@mobile_level_1_link % Hash[menu_item.map{|(k,v)| [k.to_sym(&:downcase),v]}]
                click_mobile_nav_link location
            else
                sleep 0.3
                location = @@nav_1 % Hash[menu_item.map{|(k,v)| [k.to_sym(&:downcase),v]}]
                @browser.mouse.move_to @browser.find_element(xpath: location)
                wait_for_object location
                sleep 0.4
                location = @@nav_3 % Hash[menu_item.map{|(k,v)| [k.to_sym(&:downcase),v]}]
                wait_for_object location
                sleep 0.5
                @browser.find_element(xpath: location).click
                sleep 0.5
            end
        end
  	end # click_on_navigation_level_3


    #clicks on the link - level 4
    def click_on_navigation_level_4 table
        menus = table.hashes
        menus.each do |menu_item| 
        # Level 1
        case ENV['BROWSER']
            when "iphone","ipad","android_phone","android_tablet" then
                #Expand Level 1
                sleep 1
                location = @@mobile_level_1_expand % Hash[menu_item.map{|(k,v)| [k.to_sym(&:downcase),v]}]
                expand_mobile_nav_menu_line location
                #Expand Level 2
                sleep 1
                location = @@mobile_level_1_addtl_expand % Hash[menu_item.map{|(k,v)| [k.to_sym(&:downcase),v]}]
                expand_mobile_nav_menu_line location
                sleep 1
                #Expand Level 3
                location = @@mobile_level_3_expand % Hash[menu_item.map{|(k,v)| [k.to_sym(&:downcase),v]}]
                expand_mobile_nav_menu_line location
                #Click on the link
                location = @@mobile_level_3_link % Hash[menu_item.map{|(k,v)| [k.to_sym(&:downcase),v]}]
                click_mobile_nav_link location
            end
        end
    end # click_on_navigation_level_4

  	#waits for the item to be visible
  	def wait_for_object location_param
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    	wait.until {
      	@browser.find_element(xpath: location_param)
    	}
  	end  

  	# click the '+' symbol on a line in the mobile nav menu
  	def expand_mobile_nav_menu_line expand_item
        expander_span_element = @browser.find_element(xpath: expand_item)
    	@browser.execute_script "arguments[0].click()", expander_span_element
    	sleep 1
  	end


  	# click a link in the mobile nav menu
  	def click_mobile_nav_link  link_xpath
  		@browser.find_element(xpath: link_xpath).click
  	end

end # Navigation class
