class User < ApplicationRecord
  validates :username, presence: true
  validates :username, uniqueness: true

  has_many :events, inverse_of: 'creator'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
