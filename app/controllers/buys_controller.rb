class BuysController < ApplicationController
  def index
    @buy_shipping = BuyShipping.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
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
    Payjp.api_key = "sk_test_261b9bc78b3600f5f37bc330" 
    Payjp::Charge.create(
      amount: @item.price,
      card: buys_params[:token],
      currency: 'jpy' 
    )
  end
end
