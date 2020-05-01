class SessionsController < ApplicationController

	def new

	end

	def create
		customer = Customer.find_by(email: params[:session][:email].downcase)
		if customer && customer.authenticate(params[:session][:password])
			session[:customer_id] = customer.id
			flash[:success] = "#{customer.first_name} have successfully logged in"
			redirect_to customer_path(customer)
		else
			flash.now[:danger] = "Invalid email/password combination, try again!"
			render 'new'
		end
	end

	def destroy
		session[:customer_id] = nil
		redirect_to root_path
	end


end
