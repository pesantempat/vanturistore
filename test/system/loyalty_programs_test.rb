require "application_system_test_case"

class LoyaltyProgramsTest < ApplicationSystemTestCase
  setup do
    @loyalty_program = loyalty_programs(:one)
  end

  test "visiting the index" do
    visit loyalty_programs_url
    assert_selector "h1", text: "Loyalty Programs"
  end

  test "creating a Loyalty program" do
    visit loyalty_programs_url
    click_on "New Loyalty Program"

    fill_in "End loyalty", with: @loyalty_program.end_loyalty
    fill_in "Keterangan loyalty", with: @loyalty_program.keterangan_loyalty
    fill_in "Point customer", with: @loyalty_program.point_customer
    fill_in "Point loyalty", with: @loyalty_program.point_loyalty
    fill_in "Reward", with: @loyalty_program.reward_id
    fill_in "Start loyalty", with: @loyalty_program.start_loyalty
    fill_in "Status loyalty", with: @loyalty_program.status_loyalty
    click_on "Create Loyalty program"

    assert_text "Loyalty program was successfully created"
    click_on "Back"
  end

  test "updating a Loyalty program" do
    visit loyalty_programs_url
    click_on "Edit", match: :first

    fill_in "End loyalty", with: @loyalty_program.end_loyalty
    fill_in "Keterangan loyalty", with: @loyalty_program.keterangan_loyalty
    fill_in "Point customer", with: @loyalty_program.point_customer
    fill_in "Point loyalty", with: @loyalty_program.point_loyalty
    fill_in "Reward", with: @loyalty_program.reward_id
    fill_in "Start loyalty", with: @loyalty_program.start_loyalty
    fill_in "Status loyalty", with: @loyalty_program.status_loyalty
    click_on "Update Loyalty program"

    assert_text "Loyalty program was successfully updated"
    click_on "Back"
  end

  test "destroying a Loyalty program" do
    visit loyalty_programs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Loyalty program was successfully destroyed"
  end
end
