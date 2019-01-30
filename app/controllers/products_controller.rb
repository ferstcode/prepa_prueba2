class ProductsController < ApplicationController
  def index
    @products = Product.all
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    product.save
    redirect_to  products_path(product.id)
  end 

  def edit 
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to root_path, notice: 'Info actualizada'
    else 
      redirect_to root_path, alert: 'Info no actualizada'
    end
  end


  def show
    @product = Product.find(params[:id]) 
  end

  def set_favourite
    @product = Product.find(params[:id])
    @product.favourite = true
    @product.save
    redirect_to product_show_path    

  end
  def favourites
    @products = Product.where(favourite: true)

  end


  def destroy 
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to products_path
  end 
    

   
  
  private
  def product_params 
    params.require(:product).permit(:name, :price, :description, :image, :favourite)
  end 


end 

