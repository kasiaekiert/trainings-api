require 'test_helper'

class MeetingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get meeting_index_url
    assert_response :success
  end

end
