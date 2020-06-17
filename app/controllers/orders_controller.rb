class OrdersController < ApplicationController

  def new
    @order = current_cart.order
  end

  def create
    @order = current_cart.order
    if @order.update_attributes(status: 'open')
      session[:cart_token] = nil
      redirect_to root_path
    else
      render 'new'
    end
  end

end
