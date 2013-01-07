class UserProfile < UserBase

  profile_elements

  page_url "#{$base_url}/users/edit"

  element(:current_password) { |b| b.text_field(id: "user_current_password") }
  value(:password_error) { |b| b.div(class: /control-group password/).span(class: "help-inline").text }
  button "Update Profile"
  link "cancel"
  link "Password"
  
end