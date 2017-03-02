require 'test_helper'

class RequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get form" do
    get requests_form_url
    assert_response :success
  end

  test "should get view" do
    get requests_view_url
    assert_response :success
  end

  test "should get index" do
    get requests_index_url
    assert_response :success
  end

  test "should get edit" do
    get requests_edit_url
    assert_response :success
  end

end
