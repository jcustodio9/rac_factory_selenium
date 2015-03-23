require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

BROWSER = ENV['BROWSER']
URL = ENV['URL']

Cucumber::Rake::Task.new(:travel_insurance_quote) do |t|
  t.cucumber_opts = "--tags=@travel_insurance_quote --format progress --format html --o "
end

Cucumber::Rake::Task.new(:navigation_pc) do |t|
  t.cucumber_opts = "--tags=@navigation_pc --format progress --format html --o "
end

Cucumber::Rake::Task.new(:navigation_mobile) do |t|
  t.cucumber_opts = "--tags=@navigation_mobile"# --format progress --format html --o "
end

Cucumber::Rake::Task.new(:car_insurance_quote) do |t|
  t.cucumber_opts = "--tags=@car_insurance_quote --format progress --format html --o "
end