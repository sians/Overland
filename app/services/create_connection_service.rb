class CreateConnectionService
  def initialize
  end

  # This is the flow:
  # 1. create_connections(json)
  # create the individual connections for each journey
  # RETURN array of unsaved connections

  # 2. create_journey(json, user)
  # create a new journey with valid attrs
  # save journey
  # RETURN saved Journey instance

  # 3. add_connections_to_journey(json, user)
  # call create_journey
  # save the created journey as the journey_id of each unsaved connection
  # save now valid connections
  # RETURN saved Journey instance

  def add_connections_to_journey(json, user, poi_ids)
    journey = create_journey(json, user)
    connections = create_connections(json)
    connections.each do |connection|
      connection.journey = journey
      connection.save
      # check params for the ids of POI to creat PoiBookings
      if poi_ids.keys.include? connection.start_time
        ids = poi_ids[connection.start_time].split(",")
        ids.each do |id|
          poi = Poi.find(id.to_i)
          poi_booking = PoiBooking.new
          poi_booking.poi = poi
          poi_booking.connection = connection
          poi_booking.save
        end
      end
    end
    journey
  end

  private

  def create_journey(json, user)
    journey = Journey.new
    directions = GoogleDirectionsService.new
    origin = directions.return_journey_origin(json)
    destination = directions.return_journey_destination(json)
    total_duration = directions.get_route_connections("o","d", user.storage)[0][:total_duration]
    total_distance = directions.get_route_connections("o","d", user.storage)[0][:total_distance]
    # new_journey = add_connections_to_journey(json)
    journey.name = "#{Geocoder.search(origin).first.city} to #{Geocoder.search(destination).first.city}"
    journey.start_city = origin
    journey.end_city = destination
    journey.total_duration = total_duration
    journey.total_distance = total_distance
    journey.archived = false
    journey.user = user
    journey.save
    journey
  end

  def create_connections(json)
    @directions = GoogleDirectionsService.new
    @connection = Connection.new
    connections = @directions.get_route_connections("o", "d", json)
    connections[0][:connections].map do |connection|
      new_connection = Connection.new
      new_connection.name = "#{connection[:origin_city]} to #{connection[:destination_city]}"
      new_connection.origin_city = connection[:origin_city]
      new_connection.destination_city = connection[:destination_city]
      new_connection.transport_type = connection[:transport_type]
      new_connection.provider = connection[:provider]
      new_connection.provider_website = connection[:provider_website]
      new_connection.booking_status = false
      new_connection.start_time = connection[:start_time]
      new_connection.end_time = connection[:end_time]
      new_connection.start_latitude = connection[:start_latitude]
      new_connection.start_longitude = connection[:start_longitude]
      new_connection.end_longitude = connection[:end_longitude]
      new_connection.end_latitude = connection[:end_latitude]
      # new_connection.save
      new_connection
    end
  end
end
