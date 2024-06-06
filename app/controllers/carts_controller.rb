class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :checkout]

  def show
  end

  def checkout
    order = current_user.orders.create!

    @cart.cart_items.each do |cart_item|
      order.order_items.create!(music_record: cart_item.music_record, quantity: cart_item.quantity)
      cart_item.destroy
    end
  end

  def set_cart
    @cart = current_user.cart
  end
end
