class Cart < ApplicationRecord
	has_many :cart_products
  has_many :products, through: :cart_products
  has_many :orders
  belongs_to :user

  def total
    self.cart_products.map(&:total_price).sum
  end

end
