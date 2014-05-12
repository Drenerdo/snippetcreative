require 'test_helper'

class CollaboratesControllerTest < ActionController::TestCase
  setup do
    @collaborate = collaborates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:collaborates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create collaborate" do
    assert_difference('Collaborate.count') do
      post :create, collaborate: {  }
    end

    assert_redirected_to collaborate_path(assigns(:collaborate))
  end

  test "should show collaborate" do
    get :show, id: @collaborate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @collaborate
    assert_response :success
  end

  test "should update collaborate" do
    put :update, id: @collaborate, collaborate: {  }
    assert_redirected_to collaborate_path(assigns(:collaborate))
  end

  test "should destroy collaborate" do
    assert_difference('Collaborate.count', -1) do
      delete :destroy, id: @collaborate
    end

    assert_redirected_to collaborates_path
  end
end
