class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
    	t.string :title
    	t.text :description
    	t.string :actor
    	t.decimal :price
    	t.decimal :special
      t.timestamps
    end
  end
end
