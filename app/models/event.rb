class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  belongs_to :creator, class_name: 'User'
end
