class BuysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    authenticate_user!
    redirect_to root_path if current_user.id == @item.user_id
  end
  
  def new
    @buy_delivery = BuyDelivery.new
  end

  def create
    @buy_delivery = BuyDelivery.new(buy_params)
    if @buy_delivery.valid?
       @buy_delivery.save
       redirect_to root_path
    else
      render :new
    end
  end

  private

  def buy_params
  params.require(:buy_delivery).permit(:postno, :area_id, :cities, :address, :building, :tel, :item_id )
  end

end

