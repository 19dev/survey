require 'test_helper'

class PassCodesControllerTest < ActionController::TestCase
  setup do
    @pass_code = pass_codes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pass_codes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pass_code" do
    assert_difference('PassCode.count') do
      post :create, pass_code: { pass_code_is_finished: @pass_code.pass_code_is_finished, passcode: @pass_code.passcode, poll_id: @pass_code.poll_id }
    end

    assert_redirected_to pass_code_path(assigns(:pass_code))
  end

  test "should show pass_code" do
    get :show, id: @pass_code
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pass_code
    assert_response :success
  end

  test "should update pass_code" do
    patch :update, id: @pass_code, pass_code: { pass_code_is_finished: @pass_code.pass_code_is_finished, passcode: @pass_code.passcode, poll_id: @pass_code.poll_id }
    assert_redirected_to pass_code_path(assigns(:pass_code))
  end

  test "should destroy pass_code" do
    assert_difference('PassCode.count', -1) do
      delete :destroy, id: @pass_code
    end

    assert_redirected_to pass_codes_path
  end
end
