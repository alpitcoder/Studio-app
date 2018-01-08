require 'test_helper'

class MusicStudioControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get music_studio_index_url
    assert_response :success
  end

end
