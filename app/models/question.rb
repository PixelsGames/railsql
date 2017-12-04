class Question < ApplicationRecord

  CHOICES_IN_QUESTION = 5

  belongs_to :lesson
  has_many :choices, dependent: :destroy
  has_many :questions_variants
  has_many :variants, through: :questions_variants

  accepts_nested_attributes_for :choices,
                                allow_destroy: true,
                                reject_if: proc { |choice| choice['body'].blank? }

  validate :choices_number, :correct_choice

  private

  def choices_number
    error_text = 'Должно быть 5 вариантов'
    errors.add(:body, error_text) if choices.size != CHOICES_IN_QUESTION
  end

  def correct_choice
    error_text = 'Должен быть только один правильный ответ'
    errors.add(:body, error_text) if choices.select(&:correct).count != 1
  end
end
