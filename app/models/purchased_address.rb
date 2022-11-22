class PurchasedAddress
  include ActiveModel::Model
  attr_accessor :post_number, :prefecture_id, :city_town, :house_number, :building, :phone_number, :purchased_record_id, :item_id, :user_id, :token, :price
  with_options presence: true do
    validates :post_number
    validates :prefecture_id, numericality: {other_than: 0, message: 'is invalid'}
    validates :city_town
    validates :house_number
    validates :phone_number
    validates :item_id
    validates :user_id
  end

  def save
    #購入履歴を保存し、変数に代入する
    purchased_record = PurchasedRecord.create(user_id: user_id, item_id: item_id)
    #住所を保存する
    Address.create(post_number: post_number, prefecture_id: prefecture_id, city_town: city_town, house_number: house_number, building: building, phone_number:phone_number, purchased_record_id: purchased_record.id)
  end


end



