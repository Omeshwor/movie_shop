class ShoppingCart

  delegate :net_amount,:tax, :total_amount, :customer_id, to: :order

  def initialize(token:)
    @token = token
  end

  def order
    @order ||= Order.find_or_create_by!(token: @token, status: 'cart') do |order|
      order.net_amount = 1
      order.tax  = 1
      order.total_amount = 1
      order.customer_id = current_customer
    end
  end

  def items_count
    order.items.sum(:quantity)
  end

  def add_item(product_id:, quantity:)
    product = Product.find(product_id)

    order_item = order.items.find_or_initialize_by(
      product_id: product_id
    )

    order_item.price = product.price
    order_item.quantity = quantity
    
    ActiveRecord::Base.transaction do
      order_item.save
      update_net_amount!
    end  
  end

  def remove_item(id:)
    ActiveRecord::Base.transaction do
      order.items.destroy(id)
      update_net_amount!
    end
  end

  private

  def update_net_amount!
    order.net_amount = order.items.sum('quantity * price')
    order.save
  end




end