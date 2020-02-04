class Condition < ApplicationRecord
  belongs_to :office
  belongs_to :user, dependent: :destroy

  validates :phase, :date, presence: true
  validates :memo, length: { maximum: 100, too_long: "最大%{count}文字まで使えます" }

  enum phase: [:pre_stage, :first_stage, :second_stage, :final_stage]

end
