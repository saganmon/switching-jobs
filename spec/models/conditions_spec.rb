require 'rails_helper'

describe Condition do
  before do
    @user = FactoryBot.create(:user)
    @office = FactoryBot.create(:office)
  end

  describe '#create' do

    it "is valid with phase, date, result, user_id and offie_id" do
      user = @user
      office = @office
      condition = build(:condition, user_id: user.id, office_id: office.id)
      expect(condition).to be_valid
    end

    it "is invalid without a phase" do
      user = @user
      office = @office
      condition = build(:condition, phase: "", user_id: user.id, office_id: office.id)
      condition.valid?
      expect(condition.errors[:phase]).to include("を入力してください")
    end

    it "is invalid without a date" do
      user = @user
      office = @office
      condition = build(:condition, date: "", user_id: user.id, office_id: office.id)
      condition.valid?
      expect(condition.errors[:date]).to include("を入力してください")
    end

    it "is invalid without a result" do
      user = @user
      office = @office
      condition = build(:condition, result: "", user_id: user.id, office_id: office.id)
      condition.valid?
      expect(condition.errors[:result]).to include("を入力してください")
    end

    it "is invalid without a user_id" do
      user = @user
      office = @office
      condition = build(:condition, user_id: "", office_id: office.id)
      condition.valid?
      expect(condition.errors[:user_id]).to include("を入力してください")
    end

    it "is invalid without a office_id" do
      user = @user
      office = @office
      condition = build(:condition, user_id: user.id, office_id: "")
      condition.valid?
      expect(condition.errors[:office_id]).to include("を入力してください")
    end

    it "is invalid with a memo that has less than 100 characters" do
      user = @user
      office = @office
      condition = build(:condition, memo: Faker::Lorem.characters(number: 100), user_id: user.id, office_id: office.id)
      expect(condition).to be_valid
    end

    it "is invalid with a memo that has more than 100 characters" do
      user = @user
      office = @office
      condition = build(:condition, memo: Faker::Lorem.characters(number: 101), user_id: user.id, office_id: office.id)
      condition.valid?
      expect(condition.errors[:memo]).to include("最大100文字まで使えます")
    end
  end
end