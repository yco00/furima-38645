class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item,only: [:index, :create]

  def index
    @buy_delivery = BuyDelivery.new
    if current_user == @item.user || @item.buy.present?
      redirect_to root_path
    end
  end

  
  def new
  end

  def create
    @buy_delivery = BuyDelivery.new(buy_params)
    if @buy_delivery.valid?
        pay_item
        @buy_delivery.save
        redirect_to root_path
    else
      render :index
    end
  end





  private

  def buy_params
    params.require(:buy_delivery).permit(:postno, :area_id, :cities, :address, :building, :tel).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end


  def pay_item
    Payjp.api_key =  ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: buy_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end


  def set_item
    @item = Item.find(params[:item_id])
  end


end

