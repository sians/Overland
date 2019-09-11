class Connection < ApplicationRecord
  belongs_to :journey
  has_many :poi_bookings

  validates :name, presence: true
  validates :origin_city, presence: true, allow_blank: false
  validates :destination_city, presence: true, allow_blank: false
  validates :transport_type, presence: true
  validates :provider, presence: true
end
