class BuysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @buy_delivery = BuyDelivery.new
    authenticate_user!
    redirect_to root_path if current_user.id == @item.user_id
  end
  
  def new
    @buy_delivery = BuyDelivery.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_delivery = BuyDelivery.new(buy_params)
    if @buy_delivery.valid?
       @buy_delivery.save
       redirect_to root_path
    else
      render :index
    end
  end





  private

  def buy_params
  params.require(:buy_delivery).permit(:postno, :area_id, :cities, :address, :building, :tel).merge(user_id: current_user.id, item_id: @item.id)
  end

end

