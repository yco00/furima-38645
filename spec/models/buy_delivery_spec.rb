require 'rails_helper'

RSpec.describe BuyDelivery, type: :model do
 
before do
  user = FactoryBot.create(:user)
  item = FactoryBot.create(:item)
  @buy_delivery = FactoryBot.build(:buy_delivery,  user_id: user.id, item_id: item.id)
end

describe'商品購入' do

context '購入できる場合' do
  it '必要情報を全て入力することで購入できる'do
    expect(@buy_delivery).to be_valid
  end

  it 'buildingは空白でも購入できる'do
    @buy_delivery.building=""
    expect(@buy_delivery).to be_valid
  end
end

context '購入できない場合' do

  it 'postnoが空白では購入できない'do
    @buy_delivery.postno=""
    @buy_delivery.valid?
    expect(@buy_delivery.errors.full_messages).to include("Postno can't be blank")
  end  

  it 'postnoは3桁-4桁の形式でないと購入できない'do
    @buy_delivery.postno="1234567"
    @buy_delivery.valid?
    expect(@buy_delivery.errors.full_messages).to include("Postno is invalid. Include hyphen(-)")
  end  

  it 'area_id(都道府県)を選択していないと購入できない'do
    @buy_delivery.area_id="1"
    @buy_delivery.valid?
    expect(@buy_delivery.errors.full_messages).to include("Area can't be blank")
  end  

  it 'citiesが空の場合は購入できない'do
    @buy_delivery.cities=""
    @buy_delivery.valid?
    expect(@buy_delivery.errors.full_messages).to include("Cities can't be blank")
  end  

  it 'addressが空の場合は購入できない'do
    @buy_delivery.address=""
    @buy_delivery.valid?
    expect(@buy_delivery.errors.full_messages).to include("Address can't be blank")
  end 

  it 'telの桁数が10桁未満の場合は購入できない'do
    @buy_delivery.tel="12345679"
    @buy_delivery.valid?
    expect(@buy_delivery.errors.full_messages).to include("Tel number is too short")
  end

  it 'telの桁数は最大12桁まで、超える場合は購入できない'do
    @buy_delivery.tel="1234567901234"
    @buy_delivery.valid?
    expect(@buy_delivery.errors.full_messages).to include("Tel number is too short")
  end

  it 'telは半角数字以外含まれる場合は購入できない'do
    @buy_delivery.tel="123-4567-89"
    @buy_delivery.valid?
    expect(@buy_delivery.errors.full_messages).to include("Tel number is only number")
  end

  it 'tokenが空の場合は購入できない'do
    @buy_delivery.token=""
    @buy_delivery.valid?
    expect(@buy_delivery.errors.full_messages).to include("Token can't be blank")
  end

  it 'item_idが空の場合は購入できない'do
    @buy_delivery.item_id=""
    @buy_delivery.valid?
    expect(@buy_delivery.errors.full_messages).to include("Item can't be blank")
  end

  it 'user_idが空の場合は購入できない'do
    @buy_delivery.user_id=""
    @buy_delivery.valid?
    expect(@buy_delivery.errors.full_messages).to include("User can't be blank")
  end

    end
  end
end