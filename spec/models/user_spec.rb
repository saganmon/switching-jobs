require 'rails_helper'

describe User do
  describe '#create' do

    it "is valid with a nickname, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      # user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "is invalid without a email" do
      # user = User.new(nickname: "user_1", email: "", password: "00000000", password_confirmation: "00000000")
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?      
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("を入力してください")
    end

    it "is invalid with a duplicate nickname" do
      #はじめにユーザーを登録
      user = create(:user)
      #先に登録したユーザーと同じnicknameの値を持つユーザーのインスタンスを作成
      another_user = build(:user, nickname: user.nickname)
      another_user.valid?
      expect(another_user.errors[:nickname]).to include("はすでに存在します")
    end

    it "is invalid with a duplicate email" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "is invalid with a nickname that has more than 8 characters " do
      user = build(:user, nickname: "aaaaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("は8文字以内で入力してください")
    end

    it "is valid with a nickname that has less than 8 characters " do
      user = build(:user, nickname: "aaaaaaaa")
      expect(user).to be_valid
    end

    it "is valid with an email that has an email format " do
      user = build(:user, email: "testuser@gmail.com")
      expect(user).to be_valid
    end

    it "is invalid with an email that has non-email format " do
      user = build(:user, email: "exampletestcom")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end
  end
end