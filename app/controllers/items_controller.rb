class ItemsController < ApplicationController
  before_action :move_to_new, only: [:new]

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

  private
  def item_params
    params.require(:item).permit(:name, :text, :price, :category_id, :status_id, :delivery_fee_id, :shipping_area_id,:shipping_day_id, :image).merge(user_id: current_user.id)
  end

  def move_to_new
    unless user_signed_in?
      redirect_to user_session_path
    end
  end
end
