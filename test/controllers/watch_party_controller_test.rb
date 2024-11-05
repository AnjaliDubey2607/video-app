require "test_helper"

class WatchPartyControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get watch_party_home_url
    assert_response :success
  end

  test "should get login" do
    get watch_party_login_url
    assert_response :success
  end

  test "should get party" do
    get watch_party_party_url
    assert_response :success
  end
end
