class OrdersController < BaseController
  before_action :current_cart, only: [:create]
  before_action :require_login

  def new
    @order = current_user.orders.new
  end

  def show
    @order = current_user.orders.find_by_id(params[:id])
  end

  def index
    @orders = current_user.orders
  end

  def create
    @order = current_user.orders.new(order_params)
    create_order_list(@order)
    if @order.save
      clear_cart_and_cart_products
      flash[:success] = "Your order has been successfully placed"
      redirect_to order_path(@order.id)
    else
      flash[:error] = "There is some error in placing order. Please try again"
      render 'new'
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :address, :status)
  end

  def create_order_list order
    @cart.cart_products.each do |cart_product|
      order.order_lists.new(product_id: cart_product.product_id, quantity: cart_product.quantity, price: cart_product.product.price)
    end
  end

end
