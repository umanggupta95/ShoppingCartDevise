class UserNotifyWorker
  include Sidekiq::Worker

  priority

  def perform(user_id)
    user = User.find(user_id)
    UserMailer.signup_confirmation(user).deliver
  end

end
