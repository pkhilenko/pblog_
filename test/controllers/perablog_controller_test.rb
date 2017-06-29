require 'test_helper'

class PerablogControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get perablog_index_url
    assert_response :success
  end

end
