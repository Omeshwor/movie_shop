class CustomersController < ApplicationController
  before_action :set_customer, only: [:edit, :update, :show, :destroy] 

	def index
		@customers = Customer.paginate(page: params[:page], per_page: 25)
	end

  def new
  	@customer = Customer.new
  end

  def create
  	@customer = Customer.new(customer_params)
  	if @customer.save
  		flash[:success] = "Welcome to the Movie Shop #{@customer.first_name}"
  		redirect_to customer_path(@customer)
  	else
  		render 'new'
  	end
  end

  def edit

  end

  def update
  	if @customer.update_attributes(customer_params)
  		flash[:success] = "User successfully updated"
  		redirect_to customer_path(@customer)
  	else
  		render 'edit'
  	end
  end

  def show

  end

  def destroy
  	@user.destroy
  	flash[:danger] = "User successfully destroyed"
  	redirect_to products_path
  end

  private
  def customer_params
  	params.require(:customer).permit(:first_name,:last_name, :address1, :address2, :city, :state, :zip, :country, :phone,
  								:credit_card, :credit_card_type,:credit_card_expiration, :age, :email, :password, :password_confirmation)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
 


end
