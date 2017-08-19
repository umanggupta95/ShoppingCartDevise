class UserMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers
  default from: "railstest78@gmail.com"


  def signup_confirmation(user)
    @user = user
    mail to: @user.email, subject: "Sign up Confirmation"
  end

  def order_confirmation(order)
    @order = order
    mail(to: @order.email, subject: "Order Confirmation")
  end

end
