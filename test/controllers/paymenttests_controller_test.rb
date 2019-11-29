require 'test_helper'

class PaymenttestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @paymenttest = paymenttests(:one)
  end

  test "should get index" do
    get paymenttests_url
    assert_response :success
  end

  test "should get new" do
    get new_paymenttest_url
    assert_response :success
  end

  test "should create paymenttest" do
    assert_difference('Paymenttest.count') do
      post paymenttests_url, params: { paymenttest: { amount: @paymenttest.amount, transaction: @paymenttest.transaction } }
    end

    assert_redirected_to paymenttest_url(Paymenttest.last)
  end

  test "should show paymenttest" do
    get paymenttest_url(@paymenttest)
    assert_response :success
  end

  test "should get edit" do
    get edit_paymenttest_url(@paymenttest)
    assert_response :success
  end

  test "should update paymenttest" do
    patch paymenttest_url(@paymenttest), params: { paymenttest: { amount: @paymenttest.amount, transaction: @paymenttest.transaction } }
    assert_redirected_to paymenttest_url(@paymenttest)
  end

  test "should destroy paymenttest" do
    assert_difference('Paymenttest.count', -1) do
      delete paymenttest_url(@paymenttest)
    end

    assert_redirected_to paymenttests_url
  end
end
