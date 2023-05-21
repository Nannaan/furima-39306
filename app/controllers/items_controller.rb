class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:name, :explain, :category_id, :condition_id, :delivery_id, :prefecture_id, :schedule_id, :price, :user).merge(user_id: current_user.id)
  end
end
