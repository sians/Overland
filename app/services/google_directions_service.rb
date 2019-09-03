require 'rest-client'
require 'byebug'

class GoogleDirectionsService
  def initialize
    @base_url = "https://maps.googleapis.com/maps/api/directions/json?"
    @api_key = "AIzaSyAx4tUYlKCtVdaIPqdcMKcF0ZmjysUty3k"
  end

  def make_connection(leg)

  end

  def get_legs(origin, destination)
    routes = get_routes(origin, destination)
    routes.each_with_index do |route, index|
    end
  end

  def get_routes(origin, destination)
    routes = {}
    google_response = fetch_google_directions(origin, destination)
    google_response["routes"].each_with_index do |route, index|
      routes[index] = route
    end
  end

  def fetch_google_directions(origin, destination)
    url_string = "origin=#{origin}&destination=#{destination}&mode=transit&key=#{@api_key}"
    full_query = "#{@base_url}#{url_string}"
    binding.pry
    response = RestClient.get full_query
    JSON.parse(response)
  end
end

directions = GoogleDirectionsService.new
directions.get_legs("Paris", "Bordeaux")
