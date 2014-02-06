require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  include Category::TestHelpers
  setup do
    @product = products(:one)
    @user = users(:one)
    @category = categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products_active)
    assert_not_nil assigns(:products_inactive)
  end

  test "should get new" do
    sign_in @user
    get :new
    assert_response :success
  end
  
  test "should create product" do
    sign_in @user
    assert_difference('Product.count') do
      post :create, product: { category_id: @product.category_id, color: @product.color, description: @product.description, duration: @product.duration, price: @product.price, size: @product.size, target_group: @product.target_group, title: @product.title, user_id: @product.user_id }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get :edit, id: @product
    assert_response :success
  end
   
  test "should update product" do
    sign_in @user
    patch :update, id: @product, product: { category_id: @product.category_id, color: @product.color, description: @product.description, duration: @product.duration, price: @product.price, size: @product.size, target_group: @product.target_group, title: @product.title, user_id: @product.user_id }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    sign_in @user
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end

  

end
