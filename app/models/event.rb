class Event < ApplicationRecord
  validates :title, :description, presence: true
  validates :title, uniqueness: true

  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
end
