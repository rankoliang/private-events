class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :created_events, class_name: 'Event', foreign_key: :creator_id
  has_many :attended_events, foreign_key: :attendee_id
  has_many :events, through: :attended_events do
    def accepted
      where('attended_events.accepted = ?', true)
    end

    def pending
      where('attended_events.accepted = ?', false)
    end
  end
end
