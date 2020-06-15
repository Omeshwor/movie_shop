class OrderlinesController < ApplicationController
  def index
    @orderlines = current_cart.order.orderlines.all
  end

  def create
    current_cart.add_orderline(
      product_id: params[:product_id],
      quantity: params[:quantity])

      redirect_to cart_path
  end
  
end
