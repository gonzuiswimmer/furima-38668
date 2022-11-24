require 'rails_helper'

RSpec.describe PurchasedAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchased_address = FactoryBot.build(:purchased_address, user_id: @user.id, item_id: @item.id)
    sleep 0.1 # 0.1秒待機
  end

  context '内容に問題がない場合' do
    it 'カード情報(トークン)と住所情報が記入されていれば商品を購入できる' do
      expect(@purchased_address).to be_valid
    end
    it '建物名は空でも可' do
      @purchased_address.building = ''
      expect(@purchased_address).to be_valid
    end
  end


  context '内容に問題がある場合' do
    it '郵便番号が空では購入できない' do
      @purchased_address.post_number = ""
      @purchased_address.valid?
      expect(@purchased_address.errors.full_messages).to include("Post number can't be blank")
    end
    it '郵便番号が3桁ハイフン4桁の半角文字列のみ購入できる' do
      @purchased_address.post_number = "1234567"
      @purchased_address.valid?
      expect(@purchased_address.errors.full_messages).to include("Post number is invalid. Enter it as follows (e.g. 123-4567)")
    end
    it '都道府県が空では購入できない' do
      @purchased_address.prefecture_id = "0"
      @purchased_address.valid?
      expect(@purchased_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村が空では購入できない' do
      @purchased_address.city_town = ""
      @purchased_address.valid?
      expect(@purchased_address.errors.full_messages).to include("City town can't be blank")
    end
    it '番地が空では購入できない' do
      @purchased_address.house_number = ""
      @purchased_address.valid?
      expect(@purchased_address.errors.full_messages).to include("House number can't be blank")
    end
    it '電話番号が空では購入できない' do
      @purchased_address.phone_number = ""
      @purchased_address.valid?
      expect(@purchased_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号が9桁以下では購入できない' do
      @purchased_address.phone_number = "090123"
      @purchased_address.valid?
      expect(@purchased_address.errors.full_messages).to include("Phone number is invalid. Input only number")
    end
    it '電話番号が12桁以上では登録できない' do
      @purchased_address.phone_number = "090123456789"
      @purchased_address.valid?
      expect(@purchased_address.errors.full_messages).to include("Phone number is invalid. Input only number")
    end
    it '電話番号に半角数字以外が含まれている場合、登録できない' do
      @purchased_address.phone_number = "０９０-1234-567"
      @purchased_address.valid?
      expect(@purchased_address.errors.full_messages).to include("Phone number is invalid. Input only number")
    end
    it 'クレジットカード情報が空では購入できない' do
      @purchased_address.token = ""
      @purchased_address.valid?
      expect(@purchased_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'user_idが空では購入できない' do
      @purchased_address.user_id = nil
      @purchased_address.valid?
      expect(@purchased_address.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空では購入できない' do
      @purchased_address.item_id = nil
      @purchased_address.valid?
      expect(@purchased_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end
