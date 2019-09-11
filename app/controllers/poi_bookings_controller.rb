class PoiBookingsController < ApplicationController
  def create
    skip_authorization
  end

  private

  def poi_booking_params
    params.require(:poi_booking).permit(journey_id, poi_id, booking_status, date)
  end
end
