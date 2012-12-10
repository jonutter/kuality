class SignIn < BasePage

  element(:email) { |b| b.text_field(id: "user_email") }
  element(:password) { |b| b.text_field(id: "user_password") }
  element(:remember_me) { |b| b.checkbox(id: "user_remember_me") }

  button "Sign in"
  link "Sign up"
  link "Forgot your password?"
  link "Sign in with Google"
  link "Sign in with Facebook"
  link "Register"
  link "Home"

end