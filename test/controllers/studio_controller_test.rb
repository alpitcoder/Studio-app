require 'test_helper'

class StudioControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get studio_index_url
    assert_response :success
  end

end
