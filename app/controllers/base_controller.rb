class BaseController < ApplicationController

  def current_cart
    @cart = current_user.cart || current_user.build_cart if current_user
  end

  def clear_cart_and_cart_products
    @cart.cart_products.destroy_all
  end
end
