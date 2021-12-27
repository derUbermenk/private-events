class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :attendances, foreign_key: :event_id
  has_many :attendees, through: :attendances

  scope :past_events, -> { where('date < ?', Date.today) }
  scope :future_events, -> { where('date > ?', Date.today) }
  scope :is_public, -> { where(is_private: false) }
  scope :is_private, -> { where(is_private: true) }
end
