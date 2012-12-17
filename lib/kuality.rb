require 'cgi'
require 'test-factory'
Dir["#{File.dirname(__FILE__)}/kuality/*.rb"].each {|f| require f }
Dir["#{File.dirname(__FILE__)}/kuality/page_objects/*.rb"].each {|f| require f }
Dir["#{File.dirname(__FILE__)}/kuality/data_objects/*.rb"].each {|f| require f }

# Initialize this class at the start of your test cases to
# open the specified test browser at the specified Sakai welcome page URL.
#
# The initialization will
# create the @browser variable used throughout the page classes
class Kuality

  attr_reader :browser

  def initialize(web_browser, url)
    @browser = Watir::Browser.new web_browser
    @browser.window.resize_to(1400,900)
    @browser.goto url
  end

end