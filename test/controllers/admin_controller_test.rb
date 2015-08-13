require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get index" do
    get :admin_index
    assert_response :success
  end

end
