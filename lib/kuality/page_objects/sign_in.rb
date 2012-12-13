class SignIn < BasePage

  page_url "#{$base_url}/users/sign_in"

  expected_element :login

  element(:login) { |b| b.text_field(id: "user_login") }
  element(:password) { |b| b.text_field(id: "user_password") }
  element(:remember_me) { |b| b.checkbox(id: "user_remember_me") }

  button "Sign in"
  link "Sign up"
  link "Forgot your password?"
  link "Sign in with Google"
  link "Sign in with Facebook"
  link "Register"
  link "Home"

  def log_in(username, pword)
    login.set username
    password.set pword
    sign_in
  end

end