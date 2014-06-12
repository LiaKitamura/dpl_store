class ProductsController < ApplicationController

  # The index action
  # This should list all of our products
  # index.html.erb
  def index
    @products = Product.all
  end

  # This should find a particular product
  # show.html.erb
  def show
    @product = Product.find(params[:id])
  end

  # new.html.erb
  def new
    @product = Product.new
  end

  # create action is not a 'get' so we do not create a views file
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  private

  # define a private method
  # use string parameters

  def product_params
    params.require(:product).permit(:name)
  end

end
