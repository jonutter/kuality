class BasePage < PageFactory

  class << self

    def header_elements
      link "Sign out"
      link "Reports"
      link "Register"
      link "Home"
      element(:user_menu) { |b| b.link(class: "dropdown-toggle") }
      action(:loading) { |b| b.div(class: "loading hide").wait_while_present }
      value(:alert_box) { |b| b.div(class: /alert/).text }
      value(:user_name) { |p| p.user_menu.text }
      action(:account_settings) { |p| p.user_menu.click; p.link(text: "Account Settings").click }
    end

    # Any additional needed element group defs go here...

  end

end