class Register < UserBase

  profile_elements
  password_elements

  raise "You must define the $base_url global variable for your test site" if $base_url==nil
  page_url "#{$base_url}/users/sign_up"

  link "Forgot your password?"
  link "Sign in with Google"
  link "Sign in with Facebook"
  button "Sign Up"
  link "Sign in"

end

class SignUp < Register; end