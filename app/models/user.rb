class User < ApplicationRecord
  has_many :event_qries
  has_many :events, foreign_key: :creator_id

  before_create do
    self.token = @token
  end

  def token_generator
    temp = SecureRandom.urlsafe_base64
    temp = Digest::SHA1.hexdigest temp
    @token = temp
  end

  validates :name, length: { minimum: 3 }, presence: true
end
