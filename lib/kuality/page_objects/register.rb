class Register < UserBase

  profile_elements
  password_elements

  page_url "#{ENV['base_url']}/users/sign_up"

  link "Forgot your password?"
  link "Sign in with Google"
  link "Sign in with Facebook"
  button "Sign Up"
  link "Sign in"

end