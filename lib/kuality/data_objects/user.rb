class UserObject

  include Foundry
  include DataFactory

  attr_accessor :name, :username, :email, :password, :role

  def initialize(browser, opts={})
    @browser = browser
    defaults = {
        name:     "Tester Ten",
        username: "test10",
        email:    "test10@customer1.herokuapp.com",
        password: "test10"
    }
    set_options defaults.merge(opts)
    length_warning @username
  end

  def edit opts={}
    length_warning opts[:username] unless opts[:username]==nil
    sign_in unless logged_in?
    on(Home).account_settings
    if opts.keys.to_set.subset?([:name, :username, :email].to_set)
      on UserProfile do |user|
        user.name.fit opts[:name]
        user.username.fit opts[:username]
        user.email.fit opts[:email]
        user.current_password.set @password
        user.update_profile
      end
    end
    unless opts[:password]==nil
      on(UserProfile).password
      on UserPassword do |update|
        update.password.set opts[:password]
        update.password_confirmation.set opts[:password]
        update.current_password.set @password
        update.change_password
      end
    end
    update_options(opts)
  end

  def registered?
    if logged_in?
      true
    else
      log_out if user_menu.present?
      visit Register do |check_name|
        check_name.username.set @username
        check_name.sign_up
        if check_name.username_error.present? && check_name.username_error=="has already been taken"
          true
        else
          false
        end
      end
    end
  end

  def register
    unless registered?
      visit Register do |sign_up|
        sign_up.name.set @name
        sign_up.username.set @username
        sign_up.email.set @email
        sign_up.password.set @password
        sign_up.password_confirmation.set @password
        sign_up.sign_up
      end
    end
  end
  alias_method :sign_up, :register

  def sign_in
    if logged_out?
      user_login
    else # Log the current user out, then log in
      log_out
      user_login
    end
  end
  alias_method :log_in, :sign_in

  def logged_in?
    if user_menu.present?
      user_menu.text=~/#{@name}/ ? true : false
    else
      false
    end
  end

  def logged_out?
    !logged_in?
  end

  def log_out
    s_o.click if s_o.present?
  end
  alias_method :sign_out, :log_out

  # =======
  private
  # =======

  def user_login
    visit(SignIn).log_in @email, @password
  end

  def s_o
    @browser.link(id: "navbar-link-signout")
  end

  def length_warning string
    warn "The specified username is too short" if string.length < 3
  end

  def user_menu
    @browser.link(class: "dropdown-toggle")
  end

end