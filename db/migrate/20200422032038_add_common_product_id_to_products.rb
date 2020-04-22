class AddCommonProductIdToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :common_product_id, :string
  end
end
