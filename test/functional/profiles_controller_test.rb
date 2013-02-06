require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:jason).nickname
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render a 404 on nickname not found" do
  	get :show, id: "doesn't exist"
  	assert_response :not_found
  end

  test "that variables are assigned on successful profile viewing" do
    get :show, id: users(:jason).nickname
  	assert assigns(:user)
  	assert_not_empty assigns(:workouts)
  end

  test "only shows the corrct user's workouts" do
    get :show, id: users(:jason).nickname
    assigns(:workouts).each do |workout|
      assert_equal users(:jason), workout.user
    end

  end

end
