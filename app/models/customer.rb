class Customer < ApplicationRecord
	has_many :orders
	has_many :customer_histories
end
