class CartItemsController < ApplicationController
  before_action :set_cart
  def add_to_cart
    print "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq"
    print params
    @cart_item = current_user.cart.cart_items.new(cart_item_params)
    print @cart_item
    if @cart_item.save
      print "===================================="
      redirect_to @cart, notice: 'Item was successfully added to cart.'
    else
      print "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    end
  end

  def update
    @cart_item = @cart.cart_items.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to @cart, notice: 'Item was successfully updated.'
    else
      # handle error
    end
  end

  def remove_from_cart
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path(current_user.cart)
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:music_record_id, :quantity)
  end

  def set_cart
    @cart = current_user.cart || current_user.create_cart
  end
end
