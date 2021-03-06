class PoisController < ApplicationController

  def index
  end

  def create
    skip_authorization
    @start_time = params[:start_time]
    places_service = GooglePlacesService.new(params[:lat], params[:lng])
    @lodgings = places_service.create_pois_array(places_service.fetch_places("lodgings"))
    @food = places_service.create_pois_array(places_service.fetch_places("restaurant"))
    @point_of_interest = places_service.create_pois_array(places_service.fetch_places("point_of_interest"))
  end
end
