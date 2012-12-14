class UserProfile < UserBase
  
  header_elements
  user_elements

  element(:current_password) { |b| b.text_field(id: "user_current_password") }

  button "Update"
  link "Cancel my account"
  link "Back"
  
end