class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
    	t.datetime 	:order_date
    	t.decimal	 	:net_amount
    	t.decimal		:tax
    	t.decimal		:total_amount
    	t.references :customers, null: false, foreign_key: true 

      t.timestamps
    end
  end
end