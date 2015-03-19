$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../../', 'lib'))

require 'rspec'
require 'page-object'
require 'require_all'
require 'test/unit/assertions'
require 'webdriver-user-agent'

require_all 'lib'

World(PageObject::PageFactory)
