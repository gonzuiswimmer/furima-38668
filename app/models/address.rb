class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates: :post_number
    validates: :prefecture_id, numericality: {other_than: 0, message: 'is invalid'}
    validates: :city_town
    validates: :house_number
    validates: :phone_number
  end

  belongs_to :purchased_record
  belongs_to :prefecture
end
