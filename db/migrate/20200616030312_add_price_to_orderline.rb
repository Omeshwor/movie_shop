class AddPriceToOrderline < ActiveRecord::Migration[6.0]
  def change
    add_column :orderlines, :price, :decimal, precision: 15, scale: 2, null: false
  end
end
