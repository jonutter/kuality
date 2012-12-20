class UserBase < BasePage

  header_elements

  def self.profile_elements
    element(:name) { |b| b.text_field(id: "user_name") }
    element(:username) { |b| b.text_field(id: "user_username") }
    element(:email) { |b| b.text_field(id: "user_email") }
    value(:name_error) { |b| b.div(class: /control-group string/).span(class: "help-inline").text }
    value(:email_error) { |b| b.div(class: /control-group email/).span(class: "help-inline").text }
  end

  def password_elements
    element(:current_password) { |b| b.text_field(id: "user_current_password") }
    element(:password) { |b| b.text_field(id: "user_password") }
    element(:password_confirmation) { |b| b.text_field(id: "user_password_confirmation") }
    value(:password_error) { |b| b.div(class: /control-group password/).span(class: "help-inline").text }
  end

end