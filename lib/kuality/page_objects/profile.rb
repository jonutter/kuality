class UserProfile < UserBase

  user_elements

  page_url "#{$base_url}/users/edit"

  element(:current_password) { |b| b.text_field(id: "user_current_password") }

  button "Update User"
  link "Cancel my account"
  link "Back"
  
end