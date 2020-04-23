class Product < ApplicationRecord
	belongs_to :category
	validates :title, presence: true
	validates :actor, presence: true
	validates :description, presence: true, length: {minimum: 10}
	validates :price, presence: true, numericality: true
end
