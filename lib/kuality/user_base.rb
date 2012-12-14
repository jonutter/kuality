class UserBase < BasePage

  header_elements

  def self.user_elements
    element(:name) { |b| b.text_field(id: "user_name") }
    element(:email) { |b| b.text_field(id: "user_email") }
    element(:password) { |b| b.text_field(id: "user_password") }
    element(:password_confirmation) { |b| b.text_field(id: "user_password_confirmation") }
  end

end