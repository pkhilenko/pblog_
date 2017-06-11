require 'test_helper'

class UserSessionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_session_new_url
    assert_response :success
  end

end
