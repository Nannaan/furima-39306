class RecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def new
    @record_order = RecordOrder.new
  end

  def index
    @record_order = RecordOrder.new
  end

  def create
    @record_order = RecordOrder.new(record_params)
    if @record_order.valid?
      @record_order.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def record_params
    params.require(:record_order).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number, :record).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
