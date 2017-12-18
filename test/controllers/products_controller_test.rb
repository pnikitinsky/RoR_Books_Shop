require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
    @update = {
      title: 'Lorem ipsum',
      description: 'Wibbles are fun!',
      image_url: 'lorem.jpg',
      price: 19.95
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: @update
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: @update
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
  test "should get products index" do
    get :index
    assert_response :success
    assert_select '.products .list_description', minimum: 3
    assert_select '.products .list_description dl dt', 'Programming Ruby 1.9'
    assert_select '.products .list_description dl dd', /.{1,80}/
    assert_select '.products .list_actions', minimum: 3
    ['Show', 'Edit', 'Destroy'].each do |action|
      assert_select '.products .list_actions a', action
    end
    assert_select 'a', 'New Product'
  end
end
