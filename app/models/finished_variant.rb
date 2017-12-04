class FinishedVariant < ApplicationRecord
  belongs_to :test_result
  belongs_to :variant

  has_many :answers

  accepts_nested_attributes_for :answers, allow_destroy: true
end
