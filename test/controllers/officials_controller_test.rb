require 'test_helper'

class OfficialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @official = officials(:one)
  end

  test "should get index" do
    get officials_url
    assert_response :success
  end

  test "should get new" do
    get new_official_url
    assert_response :success
  end

  test "should create official" do
    assert_difference('Official.count') do
      post officials_url, params: { official: { official_first_name: @official.official_first_name, official_last_name: @official.official_last_name, official_middle_name: @official.official_middle_name, official_position: @official.official_position } }
    end

    assert_redirected_to official_url(Official.last)
  end

  test "should show official" do
    get official_url(@official)
    assert_response :success
  end

  test "should get edit" do
    get edit_official_url(@official)
    assert_response :success
  end

  test "should update official" do
    patch official_url(@official), params: { official: { official_first_name: @official.official_first_name, official_last_name: @official.official_last_name, official_middle_name: @official.official_middle_name, official_position: @official.official_position } }
    assert_redirected_to official_url(@official)
  end

  test "should destroy official" do
    assert_difference('Official.count', -1) do
      delete official_url(@official)
    end

    assert_redirected_to officials_url
  end
end
