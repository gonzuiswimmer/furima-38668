class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]


  def index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def create
    binding.pry
    @Prefecture_record = Prefecture_record.new(order_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def order_params
    params.require(:address).permit(:post_number, :prefecture_id, :city_town, :house_number, :building, :phone_number).merge(:purchased_record, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: order_params[@item.price],
        card: order_params[:token],
        currency: 'jpy'
      )
  end
end
