require 'test_helper'

class TrackingsControllerTest < ActionController::TestCase
  setup do
    @tracking = trackings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trackings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tracking" do
    assert_difference('Tracking.count') do
      post :create, tracking: { filetype: @tracking.filetype, ftpcomplete: @tracking.ftpcomplete, ftpqueue: @tracking.ftpqueue, ftpstart: @tracking.ftpstart, importcomplete: @tracking.importcomplete, importqueue: @tracking.importqueue, importstart: @tracking.importstart, notes: @tracking.notes, sourcefile: @tracking.sourcefile }
    end

    assert_redirected_to tracking_path(assigns(:tracking))
  end

  test "should show tracking" do
    get :show, id: @tracking
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tracking
    assert_response :success
  end

  test "should update tracking" do
    put :update, id: @tracking, tracking: { filetype: @tracking.filetype, ftpcomplete: @tracking.ftpcomplete, ftpqueue: @tracking.ftpqueue, ftpstart: @tracking.ftpstart, importcomplete: @tracking.importcomplete, importqueue: @tracking.importqueue, importstart: @tracking.importstart, notes: @tracking.notes, sourcefile: @tracking.sourcefile }
    assert_redirected_to tracking_path(assigns(:tracking))
  end

  test "should destroy tracking" do
    assert_difference('Tracking.count', -1) do
      delete :destroy, id: @tracking
    end

    assert_redirected_to trackings_path
  end
end
