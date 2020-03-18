class Event < ApplicationRecord
  has_many :creators
  belongs_to :user

  validates :location, presence: true
  validates :event_date, presence: true
  validates :description, presence: true
end
