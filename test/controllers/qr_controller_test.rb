require 'test_helper'

class QrControllerTest < ActionDispatch::IntegrationTest
  test "should get generate" do
    get qr_generate_url
    assert_response :success
  end

end
