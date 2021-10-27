class CartsController < ApplicationController
  def show
    @cart = @current_cart
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end
  # def add_to_cart
  #   cartItem = CartItem.new(cart_id: params[:id], product_id: params[:product_id])
  #   if cartItem.save()
  #     render json: cartItem
  #   else
  #     render json: cartItem.errors.full_messages, status: :unprocessable_entity
  #   end
  # end
  # def remove_from_cart
  #   cartItem = CartItem.find_by(
  #     cart_id: params[:id],
  #     product_id: params[:product_id]
  #   )
  # end
  private

  def cart_params
    params.require(:cart).permit(:total, :isCheckout)
  end
end
