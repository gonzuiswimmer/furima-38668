require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
  end

  context '商品が出品でき、保存される' do
    it 'すべての情報が入力されている' do
      expect(@item).to be_valid
    end
  end

  context '商品情報が保存されない' do
    it 'imageが空では保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'item_nameが空では保存できない' do
      @item.item_name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it 'item_nameが40文字を超えると保存できない' do
      @item.item_name = Faker::Lorem.characters(number:41)
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name is too long (maximum is 40 characters)")
    end
    it 'detailsが空では保存できない' do
      @item.details = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Details can't be blank")
    end
    it 'detailsが1000文字を超えると保存できない' do
      @item.details = Faker::Lorem.characters(number:1001)
      @item.valid?
      expect(@item.errors.full_messages).to include("Details is too long (maximum is 1000 characters)")
    end
    it 'category_idが未選択では保存できない' do
      @item.category_id = "0"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is invalid")
    end
    it 'prefecture_idが未選択では保存できない' do
      @item.prefecture_id = "0"
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture is invalid")
    end
    it 'required_date_idが未選択では保存できない' do
      @item.required_date_id = "0"
      @item.valid?
      expect(@item.errors.full_messages).to include("Required date is invalid")
    end
    it 'shipping_charge_idが未選択では保存できない' do
      @item.shipping_charge_id = "0"
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge is invalid")
    end
    it 'priceが空では保存できない' do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが300円未満では保存できない' do
      @item.price = "20"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid(¥300~9,999,999)")
    end
    it 'priceが10,000,000円以上では保存できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid(¥300~9,999,999)")
    end
    it 'priceが半角数字でないと保存できない' do
      @item.price = "８０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid(¥300~9,999,999)")
    end
    it 'ユーザーモデルが紐づいていないと保存できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end
end
