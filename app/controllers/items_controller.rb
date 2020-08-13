class ItemsController < ApplicationController
  before_action :move_to_new, only: [:new]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

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
  end

  def update
    @item.update(item_params)
    if @item.save
        redirect_to root_path
      else
        render :edit
    end
  end

  def destroy
    @item.destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
  end
  end


  private
  def item_params
    params.require(:item).permit(:name, :text, :price, :category_id, :status_id, :delivery_fee_id, :shipping_area_id,:shipping_day_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_new
    unless user_signed_in?
      redirect_to user_session_path
    end
  end
end
