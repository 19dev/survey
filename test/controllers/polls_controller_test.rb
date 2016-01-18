require 'test_helper'

class PollsControllerTest < ActionController::TestCase
  setup do
    @poll = polls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:polls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create poll" do
    assert_difference('Poll.count') do
      post :create, poll: { poll_description: @poll.poll_description, poll_finish_date: @poll.poll_finish_date, poll_name: @poll.poll_name, poll_no: @poll.poll_no, poll_start_date: @poll.poll_start_date }
    end

    assert_redirected_to poll_path(assigns(:poll))
  end

  test "should show poll" do
    get :show, id: @poll
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @poll
    assert_response :success
  end

  test "should update poll" do
    patch :update, id: @poll, poll: { poll_description: @poll.poll_description, poll_finish_date: @poll.poll_finish_date, poll_name: @poll.poll_name, poll_no: @poll.poll_no, poll_start_date: @poll.poll_start_date }
    assert_redirected_to poll_path(assigns(:poll))
  end

  test "should destroy poll" do
    assert_difference('Poll.count', -1) do
      delete :destroy, id: @poll
    end

    assert_redirected_to polls_path
  end
end
