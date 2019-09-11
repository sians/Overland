require 'test_helper'

class PoiBookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get poi_bookings_create_url
    assert_response :success
  end

end
