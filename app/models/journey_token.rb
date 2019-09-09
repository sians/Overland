class JourneyToken < ApplicationRecord
  validates :token, uniqueness: true

  validates :end_city, :token, :start_city, presence: true

  before_validation :generate_token, on: :create

  def generate_token
    begin
      self.token = SecureRandom.urlsafe_base64(10, false)
    end while self.class.find_by(token: token)
  end
end
