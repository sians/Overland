class GooglePlacesService
  def initialize(lat, lng)
    @base_places_url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?"
    @base_detail_url = "https://maps.googleapis.com/maps/api/place/details/json?"
    @api_key = ENV['GOOGLE_DIRECTIONS_API']
    @lat = lat
    @lng = lng
  end

# creates poi instances in the database
# returns an array of 5 poi hashes
  def create_pois(json)
    poi_results = json["results"][0...5].map do |result|
      pois = {}
      result_json = fetch_place_id(result["place_id"])
      pois[:poi_name] = result["name"]
      pois[:google_place_id] = result["place_id"]
      pois[:location] = result["geometry"]["location"]
      pois[:address] = result["vicinity"]
      pois[:price_level] = result["price_level"] if result["price_level"].present?
      pois[:phone_number] = result_json["result"]["formatted_phone_number"]
      # pois[:opening_hours] = result_json["opening_hours"]["weekday_text"]
      pois[:website] = result_json["result"]["website"]
      pois
    end
  end

  def fetch_place_id(place_id)
    url_string = "placeid=#{place_id}&fields=formatted_phone_number,website,opening_hours&key="
    full_query = "#{@base_detail_url}#{url_string}#{@api_key}"
    response = RestClient.get URI.escape(full_query)
    JSON.parse(response)
  end

# type is the required google attr
# we are using: loding, restaurant, point_of_interest
  def fetch_places(type)
    url_string = "location=#{@lat},#{@lng}&radius=1500&type=#{type}&key="
    full_query = "#{@base_places_url}#{url_string}#{@api_key}"
    response = RestClient.get URI.escape(full_query)
    JSON.parse(response)
  end
end


places = GooglePlacesService.new(-33.8670522, 151.1957362)
j = places.fetch_places("restaurant")
puts places.create_pois(j)
places.fetch_place_id("ChIJFfyzTTeuEmsRuMxvFyNRfbk")
