require 'test_helper'

class WorkoutsControllerTest < ActionController::TestCase
  setup do
    @workout = workouts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workouts)
  end

  test "should be redirected when not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should render the new page when logged in" do
    sign_in users(:jason)
    get :new
    assert_response :success
  end

 test "should be logged in to create a workout" do
    post :create, workout: { location: "Aspire" }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create workout when logged in" do
    sign_in users(:jason)

    assert_difference('Workout.count') do
      post :create, workout: { location: @workout.location }
    end

    assert_redirected_to workout_path(assigns(:workout))
  end

  test "should create workout for the current user when logged in" do
    sign_in users(:jason)

    assert_difference('Workout.count') do
      post :create, workout: { location: @workout.location, user_id: users(:jim).id }
    end

    assert_redirected_to workout_path(assigns(:workout))
    assert_equal assigns(:workout).user_id, users(:jason).id
  end

  test "should show workout" do
    get :show, id: @workout
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get :edit, id: @workout
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should get edit when logged in" do
    sign_in users(:jason)
    get :edit, id: @workout
    assert_response :success
  end

  test "should redirect workout update when not logged in" do
    put :update, id: @workout, workout: { location: @workout.location }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should update workout when logged in" do
    sign_in users(:jason)
    put :update, id: @workout, workout: { location: @workout.location }
    assert_redirected_to workout_path(assigns(:workout))
  end

  test "should update workout for the current user when logged in" do
    sign_in users(:jason)
    put :update, id: @workout, workout: { location: @workout.location, user_id: users(:jim).id }
    assert_redirected_to workout_path(assigns(:workout))
    assert_equal assigns(:workout).user_id, users(:jason).id
  end

  test "should not update workout if nothing has changed" do
    sign_in users(:jason)
    put :update, id: @workout
    assert_redirected_to workout_path(assigns(:workout))
    assert_equal assigns(:workout).user_id, users(:jason).id
  end

  test "should destroy workout" do
    assert_difference('Workout.count', -1) do
      delete :destroy, id: @workout
    end

    assert_redirected_to workouts_path
  end
end
