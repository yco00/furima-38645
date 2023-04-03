require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user= FactoryBot.build(:user)
  end

  describe'ユーザー新規登録' do

    it '必要情報を全て入力することで登録できる'do
    expect(@user).to be_valid
    end

    it'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Nickname can't be blank")
    end

    it'emailが空では登録できない' do
      @user.email=''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")      
    end

    it'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password='123456'
      @user.password_confirmation='123567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it'firstname が空では登録できない' do
      @user.firstname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname can't be blank")
    end

    it'firstname が半角では登録できない' do
      @user.firstname = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname is invalid")
    end

    it'lastname が空では登録できない' do
      @user.lastname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname can't be blank")
    end

    it'lastname が半角では登録できない' do
      @user.lastname = 'ﾊﾅｺ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname is invalid")
    end

    it'birthday が空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    
  end
end
