def seed_categories
	12.times do 
	Category.create(
		category_name: Faker::Book.genre
	)
	end
end

seed_categories