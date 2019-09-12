class PoiBookingsController < ApplicationController
  def create
    skip_authorization
  end

  def update
    @poi_booking = PoiBooking.find(params[:id])
    skip_authorization
    @poi_booking.booking_status = true
    if @poi_booking.save
      redirect_to journey_path(@poi_booking.connection.journey_id), notice: 'Updated connection!'
    else
      redirect_to journey_path(@poi_booking.connection.journey_id), notice: "Something went wrong. Couldn't update the connection!"
    end
  end

  private

  def poi_booking_params
    params.require(:poi_booking).permit(journey_id, poi_id, booking_status, date)
  end
end
