Product.destroy_all
Category.destroy_all
Customer.destroy_all
Inventory.destroy_all


def seed_categories
	10.times do 
	Category.create!(
		category_name: 					Faker::Commerce.unique.department(max: 1)
	)
	end
end

def seed_products
	categories = Category.all

	categories.each do |category|
		5.times do
			Product.create!(
				title: 							Faker::Commerce.unique.product_name,
				description: 				Faker::Lorem.sentences[0],
				actor: 							Faker::Artist.name,
				price: 							Faker::Commerce.price(range: 1.00..20.00),
				special: 						Faker::Commerce.price(range: 0..5.0),
				category_id: 				category.id,
				common_product_id: 	Faker::Code.isbn
				)
		end
	end
end

def seed_customers
	15.times do
		Customer.create!(
			first_name: 					Faker::Name.first_name,
			last_name: 						Faker::Name.last_name,
			address1: 						Faker::Address.street_address,
			address2: 						Faker::Address.secondary_address,
			city: 								Faker::Address.city,
			zip: 									Faker::Address.zip_code,
			state: 								Faker::Address.state_abbr,
			country: 							Faker::Address.country,
			email: 								Faker::Internet.unique.safe_email,
			password: 						"password",
			password_confirmation: "password",
			phone: 								Faker::PhoneNumber.cell_phone,
			age: 									Faker::Number.between(from: 1, to: 65)
			)
	end
end

def seed_inventories
	products = Product.all

	products.each do |product|
		1.times do
			Inventory.create!(
				quantity_in_stock: rand(0..100),
				sales: rand(0..100),
				product_id: product.id
				)
		end
	end
end




seed_categories
seed_products
seed_customers
seed_inventories