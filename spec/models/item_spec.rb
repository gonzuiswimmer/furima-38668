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
    end
    it 'image_nameが空では保存できない' do
    end
    it 'detailsが空では保存できない' do
    end
    it 'category_idが未選択では保存できない' do
    end
    it 'prefecture_idが未選択では保存できない' do
    end
    it 'required_date_idが未選択では保存できない' do
    end
    it 'shipping_charge_idが未選択では保存できない' do
    end
    it 'priceが未選択では保存できない' do
    end
    it 'priceが300円未満では保存できない' do
    end
    it 'priceが10,000,000円以上では保存できない' do
    end
    it 'priceが半角数字でないと保存できない' do
    end

  end

end
