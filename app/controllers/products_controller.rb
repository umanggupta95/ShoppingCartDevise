class ProductsController < ApplicationController

	def new
    @product = Product.new
  end

  def show
    @product = Product.find_by_id(params[:id])
  end

  def edit
    @product = Product.find_by_id(params[:id])
  end

  # update
  # update_attribute
  # update_attributes
  # update_column
  # update_all

  def update
    @product = Product.find_by_id(params[:id])
    if @product.update(product_params)
      flash[:success] = "Your product has been updated successfuly "
      redirect_to root_url
    else
      flash[:error] = "There is some error in updating product. Please try again"
      render 'edit'
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "#{@product.name} is created successfully"
      redirect_to root_url
    else
      flash[:error] = "There is some error is creating product. Please try again"
      render 'new'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :quantity, picture_attributes: [:image])
  end

end
