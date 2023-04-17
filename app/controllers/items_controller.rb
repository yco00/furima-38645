class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, only: [ :show, :edit, :update, :destroy]

def index
  @items=Item.order('created_at DESC')
end

def new
  @item=Item.new
end

def create
  @item=Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
end

def show
end

def edit
  if @item.user_id != current_user.id || @item.buy.present? && current_user == @item.user
    redirect_to root_path
  end
end

def update
  if @item.update(item_params)
    redirect_to item_path(@item)
  else
    render :edit
  end  
end

def destroy
  redirect_to root_path unless current_user.id == @item.user_id
  @item.destroy
  redirect_to root_path
end


private
def item_params
  params.require(:item).permit(:image,:title,:descripition,:category_id,:condition_id,:price,:postage_id,:area_id,:shippingday_id).merge(user_id:current_user.id)
end

def set_item
  @item = Item.find(params[:id])
end



end


