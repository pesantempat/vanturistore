require "application_system_test_case"

class LoyaltyPointsTest < ApplicationSystemTestCase
  setup do
    @loyalty_point = loyalty_points(:one)
  end

  test "visiting the index" do
    visit loyalty_points_url
    assert_selector "h1", text: "Loyalty Points"
  end

  test "creating a Loyalty point" do
    visit loyalty_points_url
    click_on "New Loyalty Point"

    fill_in "Customer", with: @loyalty_point.customer_id
    fill_in "Point customer", with: @loyalty_point.point_customer
    fill_in "T mitra", with: @loyalty_point.t_mitra_id
    click_on "Create Loyalty point"

    assert_text "Loyalty point was successfully created"
    click_on "Back"
  end

  test "updating a Loyalty point" do
    visit loyalty_points_url
    click_on "Edit", match: :first

    fill_in "Customer", with: @loyalty_point.customer_id
    fill_in "Point customer", with: @loyalty_point.point_customer
    fill_in "T mitra", with: @loyalty_point.t_mitra_id
    click_on "Update Loyalty point"

    assert_text "Loyalty point was successfully updated"
    click_on "Back"
  end

  test "destroying a Loyalty point" do
    visit loyalty_points_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Loyalty point was successfully destroyed"
  end
end
