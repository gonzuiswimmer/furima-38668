require 'rails_helper'

RSpec.describe PurchasedRecord, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchased_record = FactoryBot.build(:purchased_record)
  end


end
