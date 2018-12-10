require 'test_helper'

class ProducttypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @producttype = producttypes(:one)
  end

  test "should get index" do
    get producttypes_url
    assert_response :success
  end

  test "should get new" do
    get new_producttype_url
    assert_response :success
  end

  test "should create producttype" do
    assert_difference('Producttype.count') do
      post producttypes_url, params: { producttype: { description: @producttype.description, name: @producttype.name, thumb: @producttype.thumb, user_id: @producttype.user_id } }
    end

    assert_redirected_to producttype_url(Producttype.last)
  end

  test "should show producttype" do
    get producttype_url(@producttype)
    assert_response :success
  end

  test "should get edit" do
    get edit_producttype_url(@producttype)
    assert_response :success
  end

  test "should update producttype" do
    patch producttype_url(@producttype), params: { producttype: { description: @producttype.description, name: @producttype.name, thumb: @producttype.thumb, user_id: @producttype.user_id } }
    assert_redirected_to producttype_url(@producttype)
  end

  test "should destroy producttype" do
    assert_difference('Producttype.count', -1) do
      delete producttype_url(@producttype)
    end

    assert_redirected_to producttypes_url
  end
end
