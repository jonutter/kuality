class Landing < BasePage

  header_elements

  raise "You must define the $base_url global variable for your test site" if $base_url==nil
  page_url $base_url

end

# An alias for the Landing class.
class Welcome < Landing; end