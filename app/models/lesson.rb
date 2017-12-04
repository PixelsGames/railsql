class Lesson < ApplicationRecord
  has_many :variants, dependent: :destroy

  scope :basic, -> { where(basic: true) }
  scope :optional, -> { where(basic: false) }

  validates_presence_of :name
  validates_uniqueness_of :name
end
