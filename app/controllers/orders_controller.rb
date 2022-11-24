class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]


  def index
    @purchased_address = PurchasedAddress.new
    if current_user.id == @item.user.id || @item.purchased_record.present?
      redirect_to root_path
    end
  end

  def new
    @purchased_address = PurchasedAddress.new
  end

  def create
    @purchased_address = PurchasedAddress.new(order_params)
    if @purchased_address.valid?
      pay_item
      @purchased_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  
  private
  def order_params
    params.require(:purchased_address).permit(:post_number, :prefecture_id, :city_town, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def pay_item
    item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
