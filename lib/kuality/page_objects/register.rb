 class Register < BasePage

   header_elements

   page_url "#{$base_url}/users/sign_up"

   element(:name) { |b| b.text_field(id: "user_name") }
   element(:email) { |b| b.text_field(id: "user_email") }
   element(:password) { |b| b.text_field(id: "user_password") }
   element(:password_confirmation) { |b| b.text_field(id: "user_password_confirmation") }

   button "Sign up"
   link "Sign in"
   link "Forgot your password?"
   link "Sign in with Google"
   link "Sign in with Facebook"

 end