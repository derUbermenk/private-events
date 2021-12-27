class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :attendances, foreign_key: :event_id, dependent: :destroy
  has_many :attendees, through: :attendances

  has_many :invitations, foreign_key: :event_id, dependent: :destroy
  has_many :invited_users, through: :invitations, source: :invitee

  scope :past_events, -> { where('date < ?', Date.today) }
  scope :future_events, -> { where('date > ?', Date.today) }
  scope :is_public, -> { where(is_private: false) }
  scope :is_private, -> { where(is_private: true) }
end
