class TestResult < ApplicationRecord
  has_many :finished_variants

  belongs_to :user
end
