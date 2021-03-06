require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    sign_in users(:one)
    @customer = customers(:customer_one)
    @customer.location = Location.new
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post :create, customer: { device_model: @customer.device_model, email: @customer.email, name: @customer.name, password: @customer.password , gcm_id: @customer.gcm_id , location_attributes: {lat: 0,long: 0}}
    end

    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should show customer" do
    get :show, id: @customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer
    assert_response :success
  end

  test "should update customer" do
    patch :update, id: @customer, customer: { device_model: @customer.device_model, email: @customer.email, name: @customer.name, password: @customer.password , gcm_id: @customer.gcm_id }
    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete :destroy, id: @customer
    end

    assert_redirected_to customers_path
  end

  test "should show customer location" do
    get :customer_location, id: @customer
    assert_redirected_to @customer.location
  end
end
