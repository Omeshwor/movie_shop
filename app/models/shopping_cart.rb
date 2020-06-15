class ShoppingCart
  
  def initialize(token:)
    @token = token
  end

  def order
    @order ||= Order.find_or_create_by(token: @token) do |order|
      order.net_amount = 0
    end
  end

  def items_count
    order.orderlines.sum(:quantity)
  end

  def add_orderline(product_id:, quantity:)
    product = Product.find(product_id)

    orderline = order.orderlines.find_or_initialize_by(
      product_id: product_id
    )

    orderline.quantity = quantity
    orderline.save
  end



end