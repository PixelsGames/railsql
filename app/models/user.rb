class User < ApplicationRecord

  ROLES = {
      0 => 'Пользователь',
      1 => 'Администратор'
  }.freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  belongs_to :city
  belongs_to :school

  has_many :test_results

  validates_presence_of :name, :surname

  def admin?
    role == 1
  end

  def user?
    role == 0
  end
end
