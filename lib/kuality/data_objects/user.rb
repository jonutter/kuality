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

  def create

  end

  def sign_up

  end

  def edit opts={}

    set_options(opts)
  end

  def view

  end

  def delete

  end

  def sign_in
    if logged_in?
      # do nothing
    else # see if we're on the login screen
      if @browser.text_field(id: "user_email").present?
        userlogin
      else # Log the current user out, then log in
        log_out if @browser.link(:text=>"Sign Out").present?
        userlogin
      end
    end
  end

  def logged_in?
    user_li=@browser.li(class: "brand user-name")
    if user_li.present?
      user_li.text=~/#{@name}/ ? true : false
    else
      return false
    end
  end

  def log_out
    so = @browser.link(:text=>"Sign Out")
    so.click if so.present?
  end

  private

  def userlogin
    visit SignIn do |page|
      page.log_in @email, @password
    end
  end

end

