class Item < ApplicationRecord
  extend ActiveHash::Associations::AtiveRecordExtensions


  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :required_date
  belongs_to :shipping_charge
end
