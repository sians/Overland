require 'test_helper'

class PoisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pois_index_url
    assert_response :success
  end

end
