class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def profile
  end

  def connections
    @directions = GoogleDirectionsService.new
  end

  def journey_connections
    @directions = GoogleDirectionsService.new
  end

  def journey_results


    # start_at_date = params[:starts_at].empty? ? Date.today : Date.parse(params[:starts_at])

    if params[:start_city].empty? || params[:end_city].empty?
      #raise
      redirect_to root_path, alert: "Want to stay at home? Provide a city!"
    else
      @directions = GoogleDirectionsService.new
      current_user.storage = @directions.fetch_google_directions(params[:start_city], params[:end_city])
      current_user.save
      geocode_cities(params[:start_city], params[:end_city])
      @route_connections = @directions.get_route_connections(params[:start_city], params[:end_city], current_user.storage)
      geocode_stopovers
    end

  end

  private

  def geocode_cities(start_city, end_city)
    @geo_array = [Geocoder.search(start_city).first, Geocoder.search(end_city).first]
    @markers = @geo_array.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude
      }
    end
  end

  def geocode_stopovers
    @route_connections.each do |route|
      route[1][:connections].each do |connection|
        connection_lat = connection[:end_latitude]
        connection_lng = connection[:end_longitude]
      @markers << { lat: connection_lat, lng: connection_lng }
    end
    end
  end
end
