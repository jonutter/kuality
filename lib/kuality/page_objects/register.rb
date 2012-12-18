class Register < UserBase

  user_elements

  page_url "#{$base_url}/users/sign_up"

  value(:name_error) { |b| b.div(class: /control-group string/).span(class: "help-inline").text }
  value(:email_error) { |b| b.div(class: /control-group email/).span(class: "help-inline").text }
  value(:password_error) { |b| b.div(class: /control-group password/).span(class: "help-inline").text }

  button "Sign Up"
  link "Sign in"

end