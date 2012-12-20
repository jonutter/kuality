class Register < UserBase

  profile_elements
  password_elements

  page_url "#{$base_url}/users/sign_up"

  value(:password_error) { |b| b.div(class: /control-group password/).span(class: "help-inline").text }
  link "Forgot your password?"
  link "Sign in with Google"
  link "Sign in with Facebook"
  button "Sign Up"
  link "Sign in"

end