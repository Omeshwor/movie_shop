class Customer < ApplicationRecord
	has_secure_password
	
	has_many :orders
	has_many :customer_histories

	before_save :downcase_email, :capitalize_first_name, :capitalize_last_name
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :first_name, presence: true, length: {minimum: 3, maximum: 25}
	validates :last_name, presence: true, length: {minimum: 3, maximum: 25}
	validates :address1, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :zip, presence: true
	validates :country, presence: true
	validates :email, presence: true, length: {maximum: 105}, 
										uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
	validates :password, presence: true, length: {minimum: 6, maximum: 10}

  private

  def downcase_email
    self.email = email.downcase
  end

  def capitalize_first_name
  	self.first_name = first_name.capitalize
  end

  def capitalize_last_name
  	self.last_name = last_name.capitalize
  end


end
