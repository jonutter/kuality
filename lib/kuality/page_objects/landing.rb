class Landing < BasePage

  header_elements

  page_url ENV['base_url']

end

# An alias for the Landing class.
class Welcome < Landing; end