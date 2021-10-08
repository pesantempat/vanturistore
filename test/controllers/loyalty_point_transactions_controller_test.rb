require 'test_helper'

class LoyaltyPointTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loyalty_point_transaction = loyalty_point_transactions(:one)
  end

  test "should get index" do
    get loyalty_point_transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_loyalty_point_transaction_url
    assert_response :success
  end

  test "should create loyalty_point_transaction" do
    assert_difference('LoyaltyPointTransaction.count') do
      post loyalty_point_transactions_url, params: { loyalty_point_transaction: { loyalty_point_id: @loyalty_point_transaction.loyalty_point_id, point_customer_transaction: @loyalty_point_transaction.point_customer_transaction, trans_type: @loyalty_point_transaction.trans_type } }
    end

    assert_redirected_to loyalty_point_transaction_url(LoyaltyPointTransaction.last)
  end

  test "should show loyalty_point_transaction" do
    get loyalty_point_transaction_url(@loyalty_point_transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_loyalty_point_transaction_url(@loyalty_point_transaction)
    assert_response :success
  end

  test "should update loyalty_point_transaction" do
    patch loyalty_point_transaction_url(@loyalty_point_transaction), params: { loyalty_point_transaction: { loyalty_point_id: @loyalty_point_transaction.loyalty_point_id, point_customer_transaction: @loyalty_point_transaction.point_customer_transaction, trans_type: @loyalty_point_transaction.trans_type } }
    assert_redirected_to loyalty_point_transaction_url(@loyalty_point_transaction)
  end

  test "should destroy loyalty_point_transaction" do
    assert_difference('LoyaltyPointTransaction.count', -1) do
      delete loyalty_point_transaction_url(@loyalty_point_transaction)
    end

    assert_redirected_to loyalty_point_transactions_url
  end
end
