class BasePage < PageFactory

  class << self

    def header_elements
      link "Sign Out"
      link "Reports"
      value(:alert_box) { |b| b.p(class: "alert").text }
      value(:user_name) { |b| b.li(class: "brand user-name").text }
    end

    # Any additional needed element group defs go here...

  end

end