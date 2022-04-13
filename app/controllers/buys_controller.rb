class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :buy_match
  before_action :user_check, only: [:index]
  before_action :sold_check, only: [:index]
  
  def index
    @buy_shipping = BuyShipping.new
  end

  def create
    @buy_shipping = BuyShipping.new(buys_params)
    if @buy_shipping.valid?
      pay_item
      @buy_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buys_params
    params.require(:buy_shipping).permit(:post_code, :city, :shipment_address_id, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buys_params[:token],
      currency: 'jpy' 
    )
  end

  def user_check
    if item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def sold_check
    unless item.buy.nil?
      redirect_to root_path
    end
  end

  def buy_match
    @item = Item.find(params[:item_id])
  end
end
