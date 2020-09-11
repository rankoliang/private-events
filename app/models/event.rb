class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  belongs_to :creator, class_name: 'User'
  has_many :attended_events
  has_many :attendees, through: :attended_events, source: :attendee do
    def accepted
      where('attended_events.accepted = ?', true)
    end

    def pending
      where('attended_events.accepted = ?', false)
    end
  end
  scope :past, -> { where('date <= ?', Date.today).order('date desc') }
  scope :upcoming, -> { where('date > ?', Date.today).order('date') }
end
