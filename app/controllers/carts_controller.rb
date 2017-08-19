class CartsController < BaseController
	before_action :current_cart
  before_action :authenticate_user!
  before_action :intialize_product, only: [:add_product, :update]

	def show
  end

  def add_product
    if @cart.products.include?(@chosen_product)
      flash[:error] = "Product is already present in cart "
      redirect_to cart_path(@cart) and return
    else
      cart_product = @cart.cart_products.new(product_id: @chosen_product.id, quantity: params[:cart][:quantity]).save
      redirect_to cart_path(@cart)
    end
  end

  def destroy
    cart_product = @cart.cart_products.find_by_id(params[:id])
    if cart_product.destroy
      flash[:success] = "Product is deleted successfuly"
    else
      flash[:error] = "There is some error in deleting product"
    end
    redirect_to cart_path(@cart)
  end

  def update
    cart_product = @cart.cart_products.find_by_product_id(@chosen_product.id)
    cart_product.update_attributes(quantity: params[:cart][:quantity])
    if cart_product.save
      flash[:success] = "Product quantity is updated successfuly"
      redirect_to cart_path(@cart)
    else
      flash[:error] = "There is some error in updating quantity"
      redirect to edit_path
    end

  end

  private

  def intialize_product
    @chosen_product = Product.find_by_id(params[:cart][:id])
  end

end
