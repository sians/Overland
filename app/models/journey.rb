class Journey < ApplicationRecord
  belongs_to :user
  has_many :connections

  validates :name, presence: true
  validates :start_city, presence: true, allow_blank: false
  validates :end_city, presence: true, allow_blank: false

  validates :token, presence: true
  validates :token, uniqueness: true
  before_validation :generate_token, on: :create

  TRAINS = ["Train", "Long distance train", "High speed train"]
  SUBWAYS = ["Subway", "Commuter train", "Tram"]
  BUS = ["Bus"]

  def generate_token
    begin
      self.token = SecureRandom.urlsafe_base64(10, false)
    end while self.class.find_by(token: token)
  end

  def to_param
    token
  end
end
