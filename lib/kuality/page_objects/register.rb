 class Register < UserBase

   header_elements
   user_elements

   page_url "#{$base_url}/users/sign_up"

   button "Sign up"
   link "Sign in"
   link "Forgot your password?"
   link "Sign in with Google"
   link "Sign in with Facebook"

 end