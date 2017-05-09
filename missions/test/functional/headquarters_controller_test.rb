require 'test_helper'

class HeadquartersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
