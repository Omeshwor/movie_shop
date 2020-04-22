class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :show, :destroy] 
  
  def index
    @products = Product.paginate(page: params[:page], per_page: 20)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "successfully added"
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end

  def show

  end

  def edit
  end

  def update
  end

  def destroy
    @product.destroy
    flash[:danger] = "Product destroyed successfully"
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :actor, :price, :special, :common_product_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end


end
