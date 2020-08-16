class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
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
    Payjp.api_key = "sk_test_24d7d0672375cdeff653e84f" 
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類
    )
  end
end
