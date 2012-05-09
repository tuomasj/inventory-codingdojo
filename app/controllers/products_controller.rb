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
end
