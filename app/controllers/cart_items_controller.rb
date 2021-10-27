class CartItemsController < ApplicationController  
   def create
    prod_selected = Product.find_by(id: params[:product_id])
    current_cart = @current_cart
    if current_cart.products.include?(prod_selected)
      @cart_item = current_cart.cart_items.find_by(product_id: prod_selected)
    else
    @cart_item = CartItem.new(params[:cart_item_params])
    @cart_item.cart = current_cart
    @cart_item.product = prod_selected
    end
    @cart_item.quantity+=1
    @cart_item.save
    redirect_to cart_path(current_cart)
  end
  
  def add_to_cart
    cart_item = CartItem.find_by(id:params[:id])
    cart_item.quantity+=1
    cart_item.save
    redirect_to cart_path(@current_cart)
  end

  def remove_from_cart
    cart_item = CartItem.find_by(id:params[:id])
    cart_item.quantity-=1
    if cart_item.quantity <= 0
      cart_item.destroy
    else
    cart_item.save
    end
    redirect_to cart_path(@current_cart)
  end


  def cart_item_params
    params.require(:cart_item).include(:quantity, :cart_id, :product_id)
  end
end
