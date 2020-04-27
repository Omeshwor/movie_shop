def seed_categories
	12.times do 
	Category.create(
		category_name: Faker::Book.genre
	)
	end
end

def seed_products
	categories = Category.all

	categories.each do |category|
		5.times do
			Product.create(
				title: Faker::Book.title,
				description: Faker::Lorem.sentences[0],
				actor: Faker::Artist.name,
				price: Faker::Commerce.price(range: 1.00..20.00),
				special: Faker::Commerce.price(range: 0..5.0),
				category_id: category.id,
				common_product_id: Faker::Code.isbn
				)
		end
	end
end


seed_categories
seed_products