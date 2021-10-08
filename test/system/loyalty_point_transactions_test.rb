require "application_system_test_case"

class LoyaltyPointTransactionsTest < ApplicationSystemTestCase
  setup do
    @loyalty_point_transaction = loyalty_point_transactions(:one)
  end

  test "visiting the index" do
    visit loyalty_point_transactions_url
    assert_selector "h1", text: "Loyalty Point Transactions"
  end

  test "creating a Loyalty point transaction" do
    visit loyalty_point_transactions_url
    click_on "New Loyalty Point Transaction"

    fill_in "Loyalty point", with: @loyalty_point_transaction.loyalty_point_id
    fill_in "Point customer transaction", with: @loyalty_point_transaction.point_customer_transaction
    fill_in "Trans type", with: @loyalty_point_transaction.trans_type
    click_on "Create Loyalty point transaction"

    assert_text "Loyalty point transaction was successfully created"
    click_on "Back"
  end

  test "updating a Loyalty point transaction" do
    visit loyalty_point_transactions_url
    click_on "Edit", match: :first

    fill_in "Loyalty point", with: @loyalty_point_transaction.loyalty_point_id
    fill_in "Point customer transaction", with: @loyalty_point_transaction.point_customer_transaction
    fill_in "Trans type", with: @loyalty_point_transaction.trans_type
    click_on "Update Loyalty point transaction"

    assert_text "Loyalty point transaction was successfully updated"
    click_on "Back"
  end

  test "destroying a Loyalty point transaction" do
    visit loyalty_point_transactions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Loyalty point transaction was successfully destroyed"
  end
end
