class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
    	t.string 	:first_name
    	t.string 	:last_name
    	t.text 		:address1
    	t.text		:address2
    	t.string	:city
    	t.string	:state
    	t.integer	:zip
    	t.string	:country
    	t.string	:email
    	t.integer	:phone
    	t.string	:credit_card_type
    	t.integer	:credit_card
    	t.datetime :credit_card_expiration
    	t.string	:password
    	t.integer	:age
      t.timestamps
    end
  end
end
