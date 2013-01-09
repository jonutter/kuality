class BasePage < PageFactory

  class << self

    def header_elements
      action(:sign_out) { |b| b.link(text: %|" Sign out"|).click }
      action(:reports) { |b| b.link(text: %|" Reports"|).click }
      action(:register) { |b| b.link(text: %|" Register"|).click }
      action(:home) { |b| b.link(text: %|" Home"|).click }
      element(:user_menu) { |b| b.link(class: "dropdown-toggle") }
      action(:loading) { |b| b.div(class: "loading hide").wait_while_present }
      value(:alert_box) { |b| b.div(class: /alert/).text }
      value(:user_name) { |p| p.user_menu.text }
      action(:account_settings) { |p| p.user_menu.click; p.link(text: "Account Settings").click }
    end

    # Any additional needed element group defs go here...

  end

end