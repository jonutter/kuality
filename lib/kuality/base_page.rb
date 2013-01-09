class BasePage < PageFactory

  class << self

    def header_elements
      action(:sign_out) { |b| b.link(id: "navbar-menu-link-signout").click }
      action(:sign_in) { |b| b.link(id: "navbar-link-signin").click }
      action(:reports) { |b| b.link(id: "navbar-link-reports").click }
      action(:register) { |b| b.link(id: "navbar-link-register").click }
      action(:home) { |b| b.link(text: /Home/).click }
      element(:user_menu) { |b| b.link(class: "dropdown-toggle") }
      action(:loading) { |b| b.div(class: "loading hide").wait_while_present }
      value(:alert_box) { |b| b.div(class: /alert/).text }
      value(:user_name) { |p| p.user_menu.text }
      action(:account_settings) { |p| p.user_menu.click; p.link(text: "Account Settings").click }
    end

    # Any additional needed element group defs go here...

  end

end