class QuestionsVariant < ApplicationRecord
  belongs_to :question
  belongs_to :variant
end