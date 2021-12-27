class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :events, foreign_key: :creator_id, dependent: :destroy

  has_many :attendances, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, through: :attendances, source: :event, dependent: :destroy

  has_many :invitations_received, foreign_key: :invitee_id, dependent: :destroy, class_name: 'Invitation'
  has_many :invited_events, through: :invitations, source: :event
  has_many :invitations_sent, foreign_key: :organizer_id, dependent: :destroy, class_name: 'Invitation'

  scope :all_except, ->(user) { where.not(id: user) }
end
