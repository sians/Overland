class Journey < ApplicationRecord
  belongs_to :user
  has_many :connections

  validates :name, presence: true
  validates :start_city, presence: true, allow_blank: false
  validates :end_city, presence: true, allow_blank: false
end
