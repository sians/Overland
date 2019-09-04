
class GoogleDirectionsService
  def initialize
    @base_url = "https://maps.googleapis.com/maps/api/directions/json?"
    @api_key = ENV['GOOGLE_DIRECTIONS_API']
  end

  def make_connection(step)
     connection = {}
    if step["travel_mode"] == "TRANSIT"
      connection[:origin_city] = step["transit_details"]["departure_stop"]["name"]
      connection[:destination_city] = step["transit_details"]["arrival_stop"]["name"]
      connection[:transport_type] = step["transit_details"]["line"]["vehicle"]["name"]
      connection[:provider] = step["transit_details"]["line"]["agencies"].first["name"]
      connection[:provider_website] = step["transit_details"]["line"]["agencies"].first["url"]
      connection[:booking_status] = false
      connection[:start_time] = step["transit_details"]["departure_time"]["value"] #this is a timestamp
      connection[:end_time] = step["transit_details"]["arrival_time"]["value"] #this is a timestamp
      connection[:start_latitude] = step["transit_details"]["departure_stop"]["location"]["lat"]
      connection[:start_longitude] = step["transit_details"]["departure_stop"]["location"]["lng"]
      connection[:end_latitude] = step["transit_details"]["arrival_stop"]["location"]["lat"]
      connection[:end_longitude] = step["transit_details"]["arrival_stop"]["location"]["lng"]
    end
    return connection
  end

  def get_route_connections(origin, destination, json = {})
    routes = get_routes(origin, destination, json)
    parsed_routes = {}

    routes.keys.each do |key|
      steps = routes[key]["legs"][0]["steps"]
      connections = []
      steps.each do |step|
        connection = make_connection(step)
        connections << connection unless connection.empty?
      end
      parsed_routes[key] = {
        total_duration: routes[key]["legs"][0]["duration"]["text"],
        total_distance: routes[key]["legs"][0]["distance"]["text"],
        num_connections: connections.size,
        connections: connections, #array
        google_route: routes[key] #hash
      }
    end
    return parsed_routes
  end


  def get_routes(origin, destination, json)
    routes = {}
    if json.nil? || json.empty?
      json_response = fetch_google_directions(origin, destination)
    else
      json_response = json
    end
    json_response["routes"].each_with_index do |route, index|
      routes[index] = route
    end
    routes
  end

  def fetch_google_directions(origin, destination)
    url_string = "origin=#{origin}&destination=#{destination}&mode=transit&key=#{ENV["GOOGLE_DIRECTIONS_API"]}"
    full_query = "#{@base_url}#{url_string}"
    response = RestClient.get full_query
    JSON.parse(response)
  end
end

# directions = GoogleDirectionsService.new
# x = directions.get_route_connections("Paris", "Hamburg")
