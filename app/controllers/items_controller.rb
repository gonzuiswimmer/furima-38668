class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order("created_at DESC")
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless current_user.id == @item.user.id
      redirect_to action: :index
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private 
  def item_params
    params.require(:item).permit(:item_name, :details, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :required_date_id, :price, :image).merge(user_id: current_user.id)
  end

end
