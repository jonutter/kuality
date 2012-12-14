class BasePage < PageFactory

  class << self

    def header_elements
      link "Sign Out"
      link "Reports"
      link "Register"
      element(:user_menu) { |b| b.link(class: "dropdown-toggle") }
      value(:alert_box) { |b| b.p(class: /alert/).text }
      value(:user_name) { |p| p.user_menu.text }
      action(:account_settings) { |p| p.user_menu.click; p.link(text: "Account Settings").click }
    end

    # Any additional needed element group defs go here...

  end

end