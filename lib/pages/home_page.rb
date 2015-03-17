class HomePage
	include PageObject

	page_url("#{ENV['URL']}")

	#opens the url defined in ENV['URL']
	def goto_homepage
  		visit(HomePage)
  	end
end