class ProductsController < ApplicationController
  respond_to :html

  def index
    @products = Product.all
    respond_with @products
  end
  
  def new
    @product = Product.new
    respond_with @product
  end
  
  def create
    @product = Product.new(params[:product])
    flash[:notice] = "Product saved" if @product.save
    respond_with @product
  end
  
  def show
    @product = Product.find_by_id(params[:id])
    respond_with @product
  end
  
  def edit
    @product = Product.find_by_id(params[:id])
    respond_with @product
  end
  
  def update
    @product = Product.find_by_id(params[:id])
    @product.update_attributes(params[:product])
    respond_with @product
  end
  
  def destroy
    product = Product.find_by_id(params[:id])
    product.destroy
    respond_with product
  end
end
