class User < ApplicationRecord
  validates :username, presence: true
  validates :username, uniqueness: true

  has_many :events, inverse_of: 'creator'
  has_many :attendances
  has_many :attended_events, through: :attendances
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
