class Reorder < ActiveRecord::Migration[6.0]
  def change
  	create_table :reorder do |t|
  		t.references 	:product, null: false, foreign_key: true
  		t.datetime 	 	:date_low
  		t.integer			:quantity_low
  		t.datetime		:date_reordered
  		t.integer			:quantity_ordered
  		t.datetime		:date_expected
  		t.timestamps
  	end
  end
end
