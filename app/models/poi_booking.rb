class PoiBooking < ApplicationRecord
  belongs_to :connection
  belongs_to :poi
end
