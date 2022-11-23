require 'rails_helper'

RSpec.describe PurchasedRecord, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    address = FactoryBot.create(:address)
    @purchased_record = FactoryBot.build(:purchased_record, user_id: user.id, item_id: item.id)
  end

  context '内容に問題がない場合' do
    it 'カード情報(トークン)と住所情報が記入されていれば商品を購入できる' do
      expect(@purchased_record).to be_valid
    end

    it '建物名は空でも可' do
      @purchased_address.buildig = ""
    end
  end


  context '内容に問題がある場合' do
    
  end
end
