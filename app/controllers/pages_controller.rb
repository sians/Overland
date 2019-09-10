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
    @route_connections = @directions.get_route_connections(params[:start_city], params[:end_city], current_user.storage)
    geocode_stopovers
  end

  def journey_create
    journey = JourneyToken.create(
      start_city: params[:start_city],
      end_city: params[:end_city],
      starts_at: params[:starts_at]
    )
    redirect_to journey_results_path(token: journey.token)
  end

  def journey_results
    @token = JourneyToken.find_by(token: params[:token])
    # WHOEVER SEES THIS AND KNOWS HOW TO IMPROVE THIS STATEMENT, FEEL FREE!

    unless params[:starts_at].present?
      params[:starts_at] = Date.today
    else
      Date.parse(params[:starts_at])
    end

    if @token.start_city.empty? || @token.end_city.empty?
      redirect_to root_path, alert: "Want to stay at home? Provide a city!"
    else
      @directions = GoogleDirectionsService.new
      current_user.storage = @directions.fetch_google_directions(@token.start_city, @token.end_city)
      current_user.save
      #geocode_cities(@token.start_city, @token.end_city)
      @route_connections = @directions.get_route_connections(@token.start_city, @token.end_city, current_user.storage)
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
      # start_city_lat = Geocoder.search(@geo_array.first[:origin_city]).first.data["lat"]
      # start_city_lng = Geocoder.search(@geo_array.first[:origin_city]).first.data["lon"]
      # @markers << { lat: start_city_lat, lng: start_city_lng }
    end
  end

  def geocode_stopovers
    @markers = [{ lat: @route_connections.first[1][:connections][0][:start_latitude], lng: @route_connections.first[1][:connections][0][:start_longitude] }]
    @geo_array = []
    @route_connections.each do |route|
      route[1][:connections].each do |connection|
        connection_lat = connection[:end_latitude]
        connection_lng = connection[:end_longitude]
        @geo_array << connection
        @markers << {
          lat: connection_lat,
          lng: connection_lng,
          infoWindow: { content: render_to_string(partial: "/pages/mapbox", locals: { connection: connection, route: route })}
        }
      end
    end
  end
end
