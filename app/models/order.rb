class Order < ApplicationRecord
	belongs_to :user
  has_many :order_lists

  after_save :send_confirm_mail
  before_create :set_status


  def set_status
    self.status = "In Progress"
  end

  def total_price
    self.order_lists.map(&:product_price).sum
  end

  def total_quantity
    self.order_lists.map(&:quantity).sum
  end

  def send_confirm_mail
  	OrderConfirmWorker.perform_async(self.id)
  end

end
