class ProductsController < ApplicationController
  # public methods are actions
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  # The index action
  # This should list all of our products
  # index.html.erb
  def index
    @products = Product.all
  end

  # This should find a particular product
  # show.html.erb
  def show
  end

  # new.html.erb
  def new
    @product = Product.new
  end

  # create action is not a 'get' so we do not create a views file
  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Good Job! You did it.'
      redirect_to products_path
    else
      flash[:alert] = 'Bad job! You failed.'
      render :new
    end
  end

  def edit
  end

  # redirect or render
  def update
    if @product.update_attributes(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  # redirect or render
  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  #  private methods are methods. methods in private can't be accesed outside of this class
  # define a private method
  # use string parameters

  def product_params
    params.require(:product).permit(:name)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
