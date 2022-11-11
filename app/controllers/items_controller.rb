class ItemsController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    if @user.valid?
      @user.save
      redirect_to root_path
    else
      render :new
    end
  end
end
