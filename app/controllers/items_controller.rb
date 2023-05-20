class ItemsController < ApplicationController
  
  def index
  end

  private

  def item_params
    params.require(:item).permit(:name, :explain, :category_id, :condition_id, :delivery_id, :prefecture_id, :schedule_id, :price, :user).merge(user_id: current_user.id)
  end

end
