require 'test_helper'

class UpControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
