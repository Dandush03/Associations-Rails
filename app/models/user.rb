class User < ApplicationRecord
  before_create do
    temp = SecureRandom.urlsafe_base64
    temp = Digest::SHA1.hexdigest temp
    self.token = temp
  end
  validates :name, presence: true
end
