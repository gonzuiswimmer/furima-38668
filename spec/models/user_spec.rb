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
    it "nicknameが空では保存できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では保存できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailがすでに登録されていると保存できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailは@を含む必要がある" do
      @user.email = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "パスワードが空では保存できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードは、半角英数字混合の入力でないと保存できない" do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Password must be half-width alphanumeric characters.")
    end
    it "passwordとpassword_confirmationが異なる場合、保存できない" do
      @user.password = '12345abc'
      @user.password_confirmation = '12345aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "お名前（全角）は、名字が空では保存できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "お名前（全角）は、名前が空では保存できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "お名前（全角）は、全角（漢字・ひらがな・カタカナ）でないと保存できない" do
      @user.first_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
    end
    it "お名前カナ（全角）は、名字が空では保存できない" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "お名前カナ（全角）は、名前が空では保存できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "お名前カナ（全角）は、全角（カナ）でないと保存できない" do
      @user.first_name_kana = 'てすと'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid. Input half-width characters.")
    end
    it "生年月日が空では保存できない" do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end


end
