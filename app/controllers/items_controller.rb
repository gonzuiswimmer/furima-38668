class ItemsController < ApplicationController
  def index
  end
  
  def new
    @item = Item.new
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render: :new
    end    
  end
end
