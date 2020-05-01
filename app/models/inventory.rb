class Inventory < ApplicationRecord
  belongs_to :product

  validates :quantity_in_stock, presence: true, numericality: true
  validates :sales, presence: true, numericality: true
  validates :product_id, presence: true, uniqueness: true, on: :create
end
