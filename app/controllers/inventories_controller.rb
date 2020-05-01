class InventoriesController < ApplicationController
	 before_action :set_inventory, only: [:edit, :update, :show, :destroy]

	def index
		@inventories = Inventory.paginate(page: params[:page], per_page: 25)
	end


	def new
		@inventory = Inventory.new
	end

	def create
		@inventory = Inventory.new(inventory_params)
		if @inventory.save
			flash[:success] = "Inventory amount successfully added"
			redirect_to inventories_path
		else
			render 'new'
		end
	end

	def show
	end

	def update
		if @inventory.update_attributes(inventory_params)
			flash[:success] = "Inventory successfully updated"
			redirect_to inventories_path
		else
			render 'edit'
		end
	end

	def destroy
		@inventory.destroy
		flash[:danger] = "Inventory successfully purged"
		redirect_to inventories_path
	end
	
end

  private
 
  def inventory_params
  	params.require(:inventory).permit(:product_id, :quantity_in_stock, :sales)
  end

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end
 
