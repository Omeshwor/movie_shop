class CreateOrderlines < ActiveRecord::Migration[6.0]
  def change
    create_table :orderlines do |t|
      t.integer :quantity
      t.datetime :orderdate
      t.references :products, null: false, foreign_key: true

      t.timestamps
    end
  end
end
