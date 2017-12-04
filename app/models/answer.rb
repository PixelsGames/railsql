class Answer < ApplicationRecord
  belongs_to :choice
  belongs_to :finished_variant
end
