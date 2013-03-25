require 'test_helper'

class UploadsControllerTest < ActionController::TestCase
  setup do
    @upload = uploads(:tmi)
    @user = users(:albert)
  end

  test "should get index" do
    sign_in @user
    get :index
    assert_response :success
    assert_not_nil assigns(:uploads)
  end

  test "should get new" do
    sign_in @user
    get :new
    assert_response :success
  end

  test "should create upload" do
    sign_in @user
    assert_difference('Upload.count') do
      post :create, upload: { mod_jar: test_jar }
    end

    assert_redirected_to upload_path(assigns(:upload))
  end

  test "should show upload" do
    sign_in @user
    get :show, id: @upload
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get :edit, id: @upload
    assert_response :success
  end

  test "should destroy upload" do
    sign_in @user
    assert_difference('Upload.count', -1) do
      delete :destroy, id: @upload
    end

    assert_redirected_to uploads_path
  end
end
