class Event < ApplicationRecord
  has_many :creators
  belongs_to :user
end
