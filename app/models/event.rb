class Event < ApplicationRecord
  has_many :event_qries
  belongs_to :creator, class_name: 'User'

  validates :location, presence: true
  validates :event_date, presence: true
  validates :description, presence: true
end