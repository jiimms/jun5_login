class ProductsController < ApplicationController
  def new
  	@product = Product.new
  end

  def create
  	@product=Product.new(product_params)
  	if @product.save
  		flash[:success] ="New product added"
  		redirect_to action: :index
  	else
  		flash[:danger] ="All fields are mandatory"
  		render :new
  	end
  end

  def index
  end

  def edit
  end

  def show
  end

  def product_params
  	params.require(:product).permit!
  end
end
