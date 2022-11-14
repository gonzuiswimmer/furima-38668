class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do 
    validates :image
    validates :item_name
    validates :details
    validates :category_id, numericality:{other_than:0, message:"is invalid"}
    validates :prefecture_id, numericality:{other_than:0, message:"is invalid"}
    validates :required_date_id, numericality:{other_than:0, message:"is invalid"}
    validates :shipping_charge_id, numericality:{other_than:0, message:"is invalid"}
    validates :price, presence: true, numericality: {greater_than_or_equal_to:300, less_than_or_equal_to:9999999, message:"is invalid(¥300~9,999,999)"}
  end

  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :required_date
  belongs_to :shipping_charge
end
