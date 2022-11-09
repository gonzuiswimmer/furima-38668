require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー情報が登録できる' do
    it "すべての情報が入力されており、登録・保存ができる" do
      expect(@user).to be_valid
    end
  end

  context 'ユーザー情報が登録できない' do
    it "" do
      
    end
    it "" do
      
    end
    it "" do
      
    end
    it "" do
      
    end
    it "" do
      
    end
    it "" do
      
    end
    it "" do
      
    end
  end


end
