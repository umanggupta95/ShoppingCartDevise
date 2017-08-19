class OrderConfirmWorker
  include Sidekiq::Worker

  def perform(order_id)
    order = Order.find(order_id)
    UserMailer.order_confirmation(order).deliver
  end

end