class RenameOrderlinesToOrderItems < ActiveRecord::Migration[6.0]
  def change
    rename_table :orderlines, :order_items
  end
end
