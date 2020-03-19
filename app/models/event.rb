class Event < ApplicationRecord
  has_many :event_qries
  belongs_to :creator_id, class_name: 'User', foreign_key: :creator_id

  validates :location, presence: true
  validates :event_date, presence: true
  validates :description, presence: true
end
