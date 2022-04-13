class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :user_match, only: [:edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
    if @item.buy != nil
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def user_match
    @item = Item.find(params[:id])
    if @item.user_id != current_user.id
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(
      :item_name, :item_info, :category_id, :item_status_id, :price,
      :shipment_address_id, :delivery_date_id, :delivery_charge_id, :image
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end