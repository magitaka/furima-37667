class BuysController < ApplicationController
  def index
    @buy_shipping = BuyShipping.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_shipping = BuyShipping.new(buys_params)
    if @buy_shipping.valid?
      redirect_to item_path(@item)
    else
      render :index
    end
  end

  private

  def buys_params
    params.require(:buy_shipping).permit(:post_code, :city, :shipment_address_id, :address, :building, :phone_number).merge(user_id: current_user.id)
  end
end
