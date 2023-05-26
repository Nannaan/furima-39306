class RecordsController < ApplicationController
  def new
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

  def index
  end

  private

  def record_params
    params.require(:record_order).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number, :record).merge(user_id: current_user.id)
  end
end
