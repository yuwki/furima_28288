class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_new, only: [:index]
  before_action :move_to_root, only: [:index]
  def index
  end

  def create
    @order = ItemOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private 

  def order_params
    params.permit(:token, :item_id, :post_number, :prefecture, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類
    )
  end

  def move_to_new
    unless user_signed_in? 
      redirect_to user_session_path
    end
  end

  def move_to_root
    if current_user.id == @item.user_id  || @item.order.present?
    redirect_to root_path
    end
  end
end
