class PurchasedRecord < ApplicationRecord
  attr_accesor :token

  belongs_to :user
  belongs_to :item
  has_one :address
end
