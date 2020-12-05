class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.all.includes(:user).order(id: :DESC)
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :explanation, :category_id, :area_id, :charge_id, :send_date_id, :status_id, :price, :image).merge(user_id: current_user.id)
  end
end
