class CreateInventories < ActiveRecord::Migration[6.0]
  def change
    create_table :inventories do |t|
      t.integer :quantity_in_stock
      t.integer :sales
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
