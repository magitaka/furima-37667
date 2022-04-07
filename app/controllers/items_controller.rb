class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :user_match, only: [:edit]

  def index
    @items = Item.all.order("created_at DESC")
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destory
  end

  def user_match
    @item = Item.find(params[:id])
    if @item.user_id != current_user.id
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(
      :item_name, :item_info, :category_id, :item_status_id, :price,
      :shipment_address_id, :delivery_date_id, :delivery_charge_id, :image
    ).merge(user_id: current_user.id)
  end
end