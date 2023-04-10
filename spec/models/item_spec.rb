require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item= FactoryBot.build(:item)
  end

  describe'商品出品' do

    context '出品できる場合' do
      it '必要情報を全て入力することで出品できる'do
      expect(@item).to be_valid
      end
    end
  
    context '出品できない場合' do
      it'titleが空では出品できない'do
        @item.title=''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Title can't be blank")
      end

      it'titleが40文字以上では出品できない'do
        @item.title='あ'*50
        @item.valid?
        expect(@item.errors.full_messages).to include("Title is too long (maximum is 40 characters)")
      end

      it'descripitionが空では出品できない'do
        @item.descripition=''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Descripition can't be blank")
      end

      it'descripitionが文字以上では出品できない'do
        @item.descripition='あ'*1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Descripition is too long (maximum is 1000 characters)")
      end
      
      it'category_idが1(-----)の場合は出品できない'do
        @item.category_id='1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it'condition_idが1(-----)の場合は出品できない'do
        @item.condition_id='1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it'postage_idが1(-----)の場合は出品できない'do
        @item.postage_id='1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end

      it'area_idが1(-----)の場合は出品できない'do
        @item.area_id='1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end

      it'shippingday_idが1(-----)の場合は出品できない'do
        @item.shippingday_id='1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shippingday can't be blank")
      end

      it'priceが300円未満の場合出品できない'do
        @item.price='299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it'priceが1,000万円以上の場合出品できない'do
        @item.price='10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end  

      it'priceが全角の場合出品できない'do
        @item.price='４００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it'priceが空白の場合出品できない'do
        @item.price=''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it'ユーザーが紐ついていなければ出品できない'do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it'imageが添付されていなければ出品できない'do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Image can't be blank")
      end
    end

  end
end
