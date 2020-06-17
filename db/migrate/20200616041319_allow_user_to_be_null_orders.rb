class AllowUserToBeNullOrders < ActiveRecord::Migration[6.0]
  def change
    change_column_null :orders, :customer_id, true
  end
end
