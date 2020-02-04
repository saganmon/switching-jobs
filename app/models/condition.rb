class Condition < ApplicationRecord
  belongs_to :office
  belongs_to :user

  enum phase: [:pre_stage, :first_stage, :second_stage, :final_stage]
end
