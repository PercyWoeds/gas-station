require 'test_helper'

class GasolinesControllerTest < ActionController::TestCase
  setup do
    @gasoline = gasolines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gasolines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gasoline" do
    assert_difference('Gasoline.count') do
      post :create, gasoline: { class: @gasoline.class, name: @gasoline.name, price: @gasoline.price }
    end

    assert_redirected_to gasoline_path(assigns(:gasoline))
  end

  test "should show gasoline" do
    get :show, id: @gasoline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gasoline
    assert_response :success
  end

  test "should update gasoline" do
    patch :update, id: @gasoline, gasoline: { class: @gasoline.class, name: @gasoline.name, price: @gasoline.price }
    assert_redirected_to gasoline_path(assigns(:gasoline))
  end

  test "should destroy gasoline" do
    assert_difference('Gasoline.count', -1) do
      delete :destroy, id: @gasoline
    end

    assert_redirected_to gasolines_path
  end
end
