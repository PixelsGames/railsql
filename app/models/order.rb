class Order < ApplicationRecord
  validates_presence_of :email, :guest_name
  validates_format_of :email, with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
end
