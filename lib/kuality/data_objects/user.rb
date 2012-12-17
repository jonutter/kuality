class UserObject

  include Foundry
  include DataFactory
  include StringFactory

  attr_accessor :name, :email, :password

  def initialize(browser, opts={})
    @browser = browser

    defaults = {
      :name=>"test10",
      :email=>"test10@customer1.herokuapp.com",
      :password=>"test10",
    }
    options = defaults.merge(opts)

    set_options(options)
  end

  def edit opts={}
    on(Home).account_settings
    on UserProfile do |user|
      user.name.fit opts[:name]
      user.email.fit opts[:email]
      user.current_password.set @password
      user.update_profile
    end
    set_options(opts)
  end

  def register
    visit Register do |sign_up|
      sign_up.name.set @name
      sign_up.email.set @email
      sign_up.password.set @password
      sign_up.password_confirmation.set @password
      sign_up.sign_up
    end
  end

  def sign_in
    if logged_in?
      # do nothing
    else # see if we're on the login screen
      if @browser.text_field(id: "user_login").present?
        userlogin
      else # Log the current user out, then log in
        log_out
        userlogin
      end
    end
  end

  def logged_in?
    user_menu=@browser.link(class: "dropdown-toggle")
    if user_menu.present?
      user_menu.text=~/#{@name}/ ? true : false
    else
      return false
    end
  end

  def log_out
    s_o.click if s_o.present?
  end

  private

  def userlogin
    visit SignIn do |page|
      page.log_in @email, @password
    end
  end

  def s_o
    @browser.link(id: "navbar-link-signout")
  end

end