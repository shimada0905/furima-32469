class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all.includes(:user)
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :introduction, :category_id, :condition_id, :prefecture_id, :shipping_cost_id,
                                 :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
