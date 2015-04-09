require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

BROWSER = ENV['BROWSER']
URL = ENV['URL']

time = Time.now.strftime("%Y%m%d%H%M%S")
FOLDER="test_reports\\#{time}"
FileUtils.mkdir_p FOLDER

ENV['Screen_Short_FOLDER'] = FOLDER
html_report_location = "#{FOLDER}\\test_report.html"

Cucumber::Rake::Task.new(:travel_insurance_quote) do |t|
  t.cucumber_opts = "--tags=@travel_insurance_quote --format progress --format html --o " + html_report_location
end

Cucumber::Rake::Task.new(:navigation_pc) do |t|
  t.cucumber_opts = "--tags=@navigation_pc --format progress --format html --o " + html_report_location
end

Cucumber::Rake::Task.new(:navigation_mobile) do |t|
  t.cucumber_opts = "--tags=@navigation_mobile --format progress --format html --o " + html_report_location
end

Cucumber::Rake::Task.new(:car_insurance_quote_reg) do |t|
  t.cucumber_opts = "--tags=@car_insurance_quote_reg --format progress --format html --o " + html_report_location
end