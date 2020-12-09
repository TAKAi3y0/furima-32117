class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index
  before_action :product_info

  def index
    @product_buy = ProductBuy.new
  end

  def create
    @product_buy = ProductBuy.new(order_params)
    if @product_buy.valid?
      pay_item
      @product_buy.save
      redirect_to root_path
    else
      @product = Product.find(params[:item_id])
      render action: :index
    end
  end

  def order_params
    params.require(:product_buy).permit(:zipcode, :area_id, :city, :street, :building, :phone).merge(user_id: current_user.id, product_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @product = Product.find(params[:item_id])
    redirect_to root_path unless @product.user != current_user && @product.buy.nil?
  end

  def product_info
    @product = Product.find(params[:item_id])
  end
end
