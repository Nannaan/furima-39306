class RecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    @record_order = RecordOrder.new
  end

  def create
    @record_order = RecordOrder.new(record_params)
    if @record_order.valid?
      @record_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def record_params
    params.require(:record_order).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
