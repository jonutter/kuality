class SignIn < BasePage

  header_elements

  page_url "#{$base_url}/users/sign_in"

  expected_element :login

  element(:login) { |b| b.text_field(id: "user_login") }
  element(:password) { |b| b.text_field(id: "user_password") }
  element(:remember_me) { |b| b.checkbox(id: "user_remember_me") }

  button "Sign In"

  def log_in(username, pword)
    login.set username
    password.set pword
    sign_in
  end

end