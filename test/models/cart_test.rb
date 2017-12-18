require 'test_helper'

class CartTest < ActiveSupport::TestCase
    # test "the truth" do
    #   assert true
    # end
  def new_cart_with_one_product(product_name)
    cart = Cart.create
    cart.add_product(products(product_name).id)
    cart
  end

  test 'cart should create a new line item when adding a new product' do
    cart = new_cart_with_one_product(:one)
    assert_equal 1, cart.line_items.count
    cart.add_product(products(:ruby).id)
    assert_equal 2, cart.line_items.count
  end

  test 'cart should update an existing line item when adding an existing product' do
    cart = new_cart_with_one_product(:one)
    cart.add_product(products(:one).id)
    assert_equal 1, cart.line_items.count
  end
end
