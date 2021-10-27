class ProductsController < ApplicationController
  current_cart = @current_cart

  def index
    @products = Product.all()
  end

  def show
    @product = Product.find(params[:id])
  end

  # def destroy
  #   @product = Product.find(params[:id])
  #   @product.destroy
  #   redirect_to products_path
  # end

  def products_params
    params.require(:product).include(:name, :price, :hasBasicTax, :isImported)
  end
  
end
