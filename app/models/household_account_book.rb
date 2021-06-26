class HouseholdAccountBook < ApplicationRecord
  belongs_to :user

  validates :worked_on, presence: true
  validates :note, length: { maximum: 50 }
  validates :variable_note, length: { maximum: 50 }
  validates :variable_note, length: { maximum: 50 }
  validates :income_note, length: { maximum: 50 }
end
