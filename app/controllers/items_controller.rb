class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def item_params
    params.require(:item).permit(
      :item_name, :item_info, :category_id, :item_status_id, :price,
      :shipment_address_id, :delivery_date_id, :delivery_charge_id, :image
    ).merge(user_id: current_user.id)
  end
end
