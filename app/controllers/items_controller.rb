class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit]

  def index
    @products = Product.all.includes(:user).order(id: :DESC)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    if @product.save
      redirect_to item_path(@product.id)
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :explanation, :category_id, :area_id, :charge_id, :send_date_id, :status_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @product = Product.find(params[:id])
    redirect_to action: :index unless @product.user == current_user # || @product.buy.nil?
  end
end
