class User < ApplicationRecord
  attr_reader :token
  has_many :creators
  has_many :events

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
