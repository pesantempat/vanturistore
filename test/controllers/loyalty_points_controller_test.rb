require 'test_helper'

class LoyaltyPointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loyalty_point = loyalty_points(:one)
  end

  test "should get index" do
    get loyalty_points_url
    assert_response :success
  end

  test "should get new" do
    get new_loyalty_point_url
    assert_response :success
  end

  test "should create loyalty_point" do
    assert_difference('LoyaltyPoint.count') do
      post loyalty_points_url, params: { loyalty_point: { customer_id: @loyalty_point.customer_id, point_customer: @loyalty_point.point_customer, t_mitra_id: @loyalty_point.t_mitra_id } }
    end

    assert_redirected_to loyalty_point_url(LoyaltyPoint.last)
  end

  test "should show loyalty_point" do
    get loyalty_point_url(@loyalty_point)
    assert_response :success
  end

  test "should get edit" do
    get edit_loyalty_point_url(@loyalty_point)
    assert_response :success
  end

  test "should update loyalty_point" do
    patch loyalty_point_url(@loyalty_point), params: { loyalty_point: { customer_id: @loyalty_point.customer_id, point_customer: @loyalty_point.point_customer, t_mitra_id: @loyalty_point.t_mitra_id } }
    assert_redirected_to loyalty_point_url(@loyalty_point)
  end

  test "should destroy loyalty_point" do
    assert_difference('LoyaltyPoint.count', -1) do
      delete loyalty_point_url(@loyalty_point)
    end

    assert_redirected_to loyalty_points_url
  end
end
