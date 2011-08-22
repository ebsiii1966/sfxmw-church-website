require 'test_helper'

class OrgsControllerTest < ActionController::TestCase
  setup do
    @org = orgs(:one)
    @update = {
      :id => 1,
      :name => 'test org',
      :summary => 'A parish organization',
      :description => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      :chair => 'Joe Parishoner'
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orgs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create org" do
    assert_difference('Org.count') do
      post :create, :org => @update
    end

    assert_redirected_to org_path(assigns(:org))
  end

  test "should show org" do
    get :show, :id => @org.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @org.to_param
    assert_response :success
  end

  test "should update org" do
    put :update, :id => @org.to_param, :org => @update
    assert_redirected_to org_path(assigns(:org))
  end

  test "should destroy org" do
    assert_difference('Org.count', -1) do
      delete :destroy, :id => @org.to_param
    end

    assert_redirected_to orgs_path
  end
end
