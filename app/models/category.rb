class Category < ApplicationRecord
	has_many :products

	before_save {self.category_name = category_name.capitalize }
	validates :category_name, presence: true, length: {minimum: 3},
						uniqueness: true
end
