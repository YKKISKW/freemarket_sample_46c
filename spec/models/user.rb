require 'rails_helper'

describe User do
  describe '#create' do
    it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameが空では登録できない" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "emailが空では登録できない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "passwordが空では登録できない" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "nicknameが20文字以上であれば登録できない" do
      user = build(:user, nickname: "techexper_46c_freemarket_sample")
      user.valid?
      expect(user.errors[:nickname][0]).to include("is too long")
    end

    it "nicknameが1文字以上であれば登録できる" do
      user = build(:user, nickname: "t")
      expect(user).to be_valid
    end

    it "重複したemailが存在する場合登録できない" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "passwordが6文字以上であれば登録できる" do
      user = build(:user, password: "666666",password_confirmation: "666666")
      expect(user).to be_valid
    end

    it "passwordが5文字以下であれば登録できない" do
      user = build(:user, password: "55555",password_confirmation: "55555")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end
  end
end
