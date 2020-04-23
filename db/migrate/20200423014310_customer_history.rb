class CustomerHistory < ActiveRecord::Migration[6.0]
  def change
  	create_table :customer_history do |t|
  		t.integer :order_id
  		t.integer :product_id
  		t.timestamps
  	end
  end
end
