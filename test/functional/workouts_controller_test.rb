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

  test "should be logged in to a add a new Workout" do
    post :create, workout: {location: "Aspire"}
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create workout" do
    assert_difference('Workout.count') do
      post :create, workout: { date: @workout.date, location: @workout.location, notes: @workout.notes }
    end

    assert_redirected_to workout_path(assigns(:workout))
  end

  test "should show workout" do
    get :show, id: @workout
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @workout
    assert_response :success
  end

  test "should update workout" do
    put :update, id: @workout, workout: { date: @workout.date, location: @workout.location, notes: @workout.notes }
    assert_redirected_to workout_path(assigns(:workout))
  end

  test "should destroy workout" do
    assert_difference('Workout.count', -1) do
      delete :destroy, id: @workout
    end

    assert_redirected_to workouts_path
  end
end
