class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.all.order("created_at DESC")
    @purchased_record = PurchasedRecord.all
  end
  
  def new
    @item = Item.new
  end
    
  def create
    @item = Item.new(item_params)
    if  @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if current_user.id != @item.user.id || @item.purchased_record.present?
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private 
  def item_params
    params.require(:item).permit(:item_name, :details, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :required_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
