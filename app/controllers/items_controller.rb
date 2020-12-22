class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit]

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

  end

  def edit

  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :introduction, :category_id, :condition_id, :prefecture_id, :shipping_cost_id,
                                 :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless @item.user.id == current_user.id
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
