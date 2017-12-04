class Variant < ApplicationRecord

  QUESTIONS_IN_VARIANT = 25

  belongs_to :lesson
  has_many :questions_variants
  has_many :questions, through: :questions_variants
  has_many :finished_variants

  accepts_nested_attributes_for :questions_variants, allow_destroy: true

  validate :questions_number

  private

  def questions_number
    error_text = 'В одном варианте должно быть ровно 25 вопросов'
    errors.add(:questions, error_text) if questions.size != QUESTIONS_IN_VARIANT
  end
end
