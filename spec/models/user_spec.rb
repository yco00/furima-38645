require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user= FactoryBot.build(:user)
  end

  describe'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '必要情報を全て入力することで登録できる'do
      expect(@user).to be_valid
      end
    end  

    context '新規登録できない場合' do
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

      it'emailに@を含まない場合登録できない' do
        @user.email='testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email is invalid")     
      end

      it'重複したメールアドレスは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email=@user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include ("Email has already been taken")
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

      it'passwordが6文字未満では登録できない'do
        @user.password='aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")
      end

      it'passwordが英字のみでは登録できない'do
        @user.password='aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is invalid")
      end

      it'passwordが数字のみでは登録できない'do
        @user.password='11111111'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is invalid")
      end

      it'passwordに全角を含む場合は登録できない'do
        @user.password='h１111111'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is invalid")
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

      it'firstnameruby  が空では登録できない' do
        @user.firstnameruby  = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstnameruby can't be blank")
      end

      it'firstnameruby が全角カタカナ以外では登録できない' do
        @user.firstnameruby   = 'はなこ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstnameruby is invalid")
      end
  
      it'lastnameruby  が空では登録できない' do
        @user.lastnameruby  = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastnameruby can't be blank")
      end

      it'lastnameruby が全角カタカナ以外では登録できない' do
        @user.lastnameruby   = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastnameruby is invalid")
      end
  

      it'birthday が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
