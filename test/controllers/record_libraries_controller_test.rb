require 'test_helper'

class RecordLibrariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @record_library = record_libraries(:one)
  end

  test "should get index" do
    get record_libraries_url
    assert_response :success
  end

  test "should get new" do
    get new_record_library_url
    assert_response :success
  end

  test "should create record_library" do
    assert_difference('RecordLibrary.count') do
      post record_libraries_url, params: { record_library: { album_id: @record_library.album_id, user_id: @record_library.user_id } }
    end

    assert_redirected_to record_library_url(RecordLibrary.last)
  end

  test "should show record_library" do
    get record_library_url(@record_library)
    assert_response :success
  end

  test "should get edit" do
    get edit_record_library_url(@record_library)
    assert_response :success
  end

  test "should update record_library" do
    patch record_library_url(@record_library), params: { record_library: { album_id: @record_library.album_id, user_id: @record_library.user_id } }
    assert_redirected_to record_library_url(@record_library)
  end

  test "should destroy record_library" do
    assert_difference('RecordLibrary.count', -1) do
      delete record_library_url(@record_library)
    end

    assert_redirected_to record_libraries_url
  end
end
